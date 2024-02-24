import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'firebase_repo.dart';

class CounterProvider with ChangeNotifier {
  int count = 1;

  void increment() {
    count++;
    notifyListeners();
  }
}

class AddUserProvider with ChangeNotifier {
  File? pickedImage;
  bool loading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> createUser(BuildContext context) async {
    loading = true;
    notifyListeners();
    try {
      await FirebaseRepo.createUser(
        email: emailController.text,
        password: passwordController.text,
        imageFile: pickedImage ?? File(""),
      );
      loading = false;
      notifyListeners();
      Navigator.pop(context);
    } catch (e, s) {
      loading = false;
      notifyListeners();
      print(e.toString() + s.toString());
    }
  }

  void pickImage(ImageSource imageSource) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageSource);
      if (photo == null) return;
      pickedImage = File(photo.path);
      notifyListeners();
    } catch (ex) {
      log(ex.toString());
    }
  }
}
