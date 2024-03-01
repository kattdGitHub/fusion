import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fusion/utils/navigator.dart';
import 'package:image_picker/image_picker.dart';

import '../repos/restaurants_Add.dart';

class RestaurantsProvider with ChangeNotifier {
  File? pickedImage;
  File? docFile;

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

  Future<void> selectTime(BuildContext context,{required TextEditingController controller,}) async {
    try {
      final TimeOfDay? picked_s = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
          builder: (BuildContext context, Widget? child) {
            return MediaQuery(
              data:
                  MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
              child: child ?? SizedBox(),
            );
          },
      );
      if (picked_s != null){
        print("{${picked_s}}");
        // controller.text=picked_s.
      } ;
    } catch (e, s) {
      print(s);
    }
  }
}
