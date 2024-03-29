import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fusion/business_logic/models/restaurant_model.dart';
import 'package:fusion/business_logic/repos/menu_repo.dart';
import 'package:fusion/utils/navigator.dart';
import 'package:image_picker/image_picker.dart';

import '../repos/restaurants_repo.dart';

class RestaurantsProvider with ChangeNotifier {
  File? pickedImage;
  File? docFile;
  String? restarurantIdLoading;
  bool restarurantLoading = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController openTimeController = TextEditingController();
  final TextEditingController closeTimeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController documentUrlController = TextEditingController();

  void clear() {
    pickedImage = null;
    nameController.clear();
    locationController.clear();
    phoneNumberController.clear();
    websiteController.clear();
    openTimeController.clear();
    closeTimeController.clear();
    descriptionController.clear();
    imageUrlController.clear();
    documentUrlController.clear();

    notifyListeners();
  }

  void update(RestaurantModel restaurantModel) {
    nameController.text = restaurantModel.name ?? '';
    locationController.text = restaurantModel.location ?? '';
    phoneNumberController.text = restaurantModel.phoneNumber ?? '';
    openTimeController.text = restaurantModel.openTime ?? '';
    closeTimeController.text = restaurantModel.closeTime ?? '';
    descriptionController.text = restaurantModel.description ?? '';
    imageUrlController.text = restaurantModel.image ?? '';
    descriptionController.text = restaurantModel.description ?? '';
  }

  Future<void> saveRestaurantDetails(BuildContext context) async {
    try {
      restarurantLoading = true;
      notifyListeners();
      final response = await RestaurantsRepo.createRestaurant(
        name: nameController.text,
        location: locationController.text,
        phoneNumber: phoneNumberController.text,
        openTime: openTimeController.text,
        closeTime: closeTimeController.text,
        description: descriptionController.text,
        imageFile: pickedImage ?? File(""),
        docFile: docFile ?? File(""),
      );
      restarurantLoading = false;
      notifyListeners();
      if (response == false) return;
      clear();
      back(context);
    } catch (e, s) {
      restarurantLoading = false;
      notifyListeners();
      print('restaurant${e.toString() + s.toString()}');
    }
  }

  void pickImage(ImageSource imageSource) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageSource);
      if (photo == null) return;
      pickedImage = File(photo.path);
      notifyListeners();
    } catch (e, s) {
      print('pickImage: ${e.toString() + s.toString()}');
    }
  }

  void pickDoc() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc'],
      );
      if (result == null || result.files.isEmpty) return;

      docFile = File(result.files.single.path!);

      notifyListeners();
    } catch (e, s) {
      print('pickImage: ${e.toString() + s.toString()}');
    }
  }

  Future<void> selectTime(BuildContext context,
      {required TextEditingController controller}) async {
    try {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child ?? SizedBox(),
          );
        },
      );
      if (pickedTime != null) {
        print("$pickedTime");
        controller.text = "${pickedTime.hour}:${pickedTime.minute}";
      }
    } catch (e, s) {
      print(s);
    }
  }
  Future<void> editMenuDetails({
    required BuildContext context,
    required String menuId,
  }) async {
    try {
      restarurantLoading = true;
      notifyListeners();
      final response = await MenuRepo.editMenu(
        name: nameController.text,

        description: descriptionController.text,
        imageFile: pickedImage,
        menuId:menuId,
      );
      restarurantLoading = false;
      notifyListeners();
      if (response == false) return;
      clear();
      back(context);
    } catch (e, s) {
      restarurantLoading = false;
      notifyListeners();
      print(
        'restaurant${e.toString() + s.toString()}',
      );
    }
  }

  Future<void> deleteMenu(String restarurantId) async {
    try {
      restarurantIdLoading = restarurantId;
      notifyListeners();
      await MenuRepo.deleteMenu(restarurantId);
      restarurantIdLoading = null;
      notifyListeners();
    } catch (e, s) {
      restarurantIdLoading = null;
      notifyListeners();
      print(
        'menu${e.toString() + s.toString()}',
      );
    }
  }
}
