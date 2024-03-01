import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:fusion/business_logic/repos/menu_repo.dart';
import 'package:fusion/utils/navigator.dart';
import 'package:image_picker/image_picker.dart';

class MenuProvider with ChangeNotifier {
  File? pickedImage;
  bool menuLoading = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  TextEditingController quantityController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Future<void> saveMenuDetails(
      {required BuildContext context, required restaurantId}) async {
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
      back(context);
    } catch (e, s) {
      menuLoading = false;
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

}
