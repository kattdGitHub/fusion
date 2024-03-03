import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fusion/business_logic/models/menu_model.dart';
import 'package:fusion/business_logic/repos/menu_repo.dart';
import 'package:fusion/utils/navigator.dart';
import 'package:image_picker/image_picker.dart';

class MenuProvider with ChangeNotifier {
  File? pickedImage;

  bool menuLoading = false;
  String? menuIdLoading;
  TextEditingController nameController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();


  void clear() {
    pickedImage = null;
    nameController.clear();
    priceController.clear();
    imageController.clear();
    quantityController.clear();
    descriptionController.clear();
    notifyListeners();
  }

  void update(MenuModel menuModel) {
    nameController.text = menuModel.name ?? '';
    priceController.text = menuModel.price ?? '';
    imageController.text = menuModel.image ?? '';
    quantityController.text = menuModel.quantity ?? '';
    descriptionController.text = menuModel.description ?? '';
  }

  Future<void> saveMenuDetails({
    required BuildContext context,
    required restaurantId,
  }) async {
    try {
      menuLoading = true;
      notifyListeners();
      final response = await MenuRepo.createMenu(
        name: nameController.text,
        quantity: quantityController.text,
        price: priceController.text,
        description: descriptionController.text,
        imageFile: pickedImage ?? File(""),
        restaurantId: restaurantId,
      );
      menuLoading = false;
      notifyListeners();
      if (response == false) return;
      clear();
      back(context);
    } catch (e, s) {
      menuLoading = false;
      notifyListeners();
      print(
        'restaurant${e.toString() + s.toString()}',
      );
    }
  } Future<void> editMenuDetails({
    required BuildContext context,
    required String menuId,
  }) async {
    try {
      menuLoading = true;
      notifyListeners();
      final response = await MenuRepo.editMenu(
        name: nameController.text,
        quantity: quantityController.text,
        price: priceController.text,
        description: descriptionController.text,
        imageFile: pickedImage,
        menuId:menuId,
      );
      menuLoading = false;
      notifyListeners();
      if (response == false) return;
      clear();
      back(context);
    } catch (e, s) {
      menuLoading = false;
      notifyListeners();
      print(
        'restaurant${e.toString() + s.toString()}',
      );
    }
  }

  Future<void> deleteMenu(String menuId) async {
    try {
      menuIdLoading = menuId;
      notifyListeners();
      await MenuRepo.deleteMenu(menuId);
      menuIdLoading = null;
      notifyListeners();
    } catch (e, s) {
      menuIdLoading = null;
      notifyListeners();
      print(
        'menu${e.toString() + s.toString()}',
      );
    }
  }

  void pickImage(ImageSource imageSource) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageSource);
      if (photo == null) return;
      pickedImage = File(photo.path);
      imageController.clear();
      notifyListeners();
    } catch (e, s) {
      print('pickImage: ${e.toString() + s.toString()}');
    }
  }
}
