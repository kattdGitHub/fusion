import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fusion/business_logic/repos/auth_repo.dart';
import 'package:fusion/screens/auth_screens/login_screen.dart';
import 'package:fusion/screens/home/Choose_a_Restaurant.dart';
import 'package:fusion/utils/helper_widget.dart';
import 'package:fusion/utils/navigator.dart';
import 'package:image_picker/image_picker.dart';

class AuthProvider with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  File? pickedImage;
  bool logOutLoading = false;
  bool deleteLoading = false;
  bool loginLoading = false;
  bool updateProfileLoading = false;
  bool resetPasswordLoading = false;
  bool registerLoading = false;

  Future<void> createUser({
    required BuildContext context,
    required TextEditingController firstName,
    required TextEditingController lastName,
    required TextEditingController phoneNumber,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController confirmPasswordController,
  }) async {
    try {
      registerLoading = true;
      notifyListeners();
      final response = await AuthRepo.createUser(
        email: emailController.text,
        firstName: firstName.text,
        lastName: lastName.text,
        phoneNumber: phoneNumber.text,
        password: passwordController.text,
        imageFile: pickedImage ?? File(""),
      );
      registerLoading = false;
      notifyListeners();

      /// save user is login
      if (response == false) return;
      await localStorage.setUserLogin(true);
      pushAndRemoveUntil(context, const ChooseRestaurant());
    } catch (e, s) {
      registerLoading = false;
      notifyListeners();
      print('createUser: ${e.toString() + s.toString()}');
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

  Future<void> googleLogin(BuildContext context) async {
    try {
      final response= await AuthRepo.signInWithGoogleAndAddToFirestore();

      /// save user is login
      if(response==false)return;
      await localStorage.setUserLogin(true);
      pushAndRemoveUntil(context, const ChooseRestaurant());
    } catch (e, s) {
      print('googleLogin: ${e.toString() + s.toString()}');
    }
  }

  void logOut(BuildContext context) async {
    try {
      logOutLoading = true;
      notifyListeners();
      final response=await AuthRepo.signOut();
      logOutLoading = false;
      notifyListeners();

      /// save user is login
      if(response==false)return;
      await localStorage.setUserLogin(false);
      pushAndRemoveUntil(context, LoginScreen());
    } catch (e, s) {
      logOutLoading = false;
      notifyListeners();
      print('logOut: ${e.toString() + s.toString()}');
    }
  }

  void deleteAccount({
    required BuildContext context,
    required String userId,
  }) async {
    try {
      deleteLoading = true;
      notifyListeners();
     final response= await AuthRepo.deleteAccount();
      deleteLoading = false;
      notifyListeners();

      /// save user is login
      if(response==false)return;
      await localStorage.setUserLogin(false);
      pushAndRemoveUntil(context, LoginScreen());
    } catch (e, s) {
      deleteLoading = false;
      notifyListeners();
      print('deleteAccount: ${e.toString() + s.toString()}');
    }
  }

  void resetPassword(BuildContext context) async {
    try {
      resetPasswordLoading = true;
      notifyListeners();
      final response = await AuthRepo.resetPassword(emailController.text);
      resetPasswordLoading = false;
      notifyListeners();

      /// save user is login
      if (!response) return;
      await localStorage.setUserLogin(false);
      pushAndRemoveUntil(context, LoginScreen());
    } catch (e, s) {
      resetPasswordLoading = false;
      notifyListeners();
      print('resetPassword: ${e.toString() + s.toString()}');
    }
  }

  void login(BuildContext context) async {
    try {
      loginLoading = true;
      notifyListeners();
      final response= await AuthRepo.login(
        email: emailController.text,
        password: passwordController.text,
      );
      loginLoading = false;
      notifyListeners();

      /// save user is login
     if(response==false)return;
      await localStorage.setUserLogin(true);
      pushAndRemoveUntil(context, ChooseRestaurant());
    } catch (e, s) {
      loginLoading = false;
      notifyListeners();
      print('Login : ${e.toString() + s.toString()}');
    }
  }

  Future<void> updateProfile({
    required BuildContext context,
    required String docId,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    File? imageFile,
  }) async {
    try {
      updateProfileLoading = true;
      notifyListeners();
     final response= await AuthRepo.updateProfile(
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        imageFile: imageFile,
      );
      updateProfileLoading = false;
      notifyListeners();
      if(response)back(context);
    } catch (e, s) {
      updateProfileLoading = false;
      notifyListeners();
      print('updateProfile : ${e.toString() + s.toString()}');
    }
  }
}
