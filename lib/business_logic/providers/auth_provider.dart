import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fusion/Screen_All/LoginScreenNew.dart';
import 'package:fusion/business_logic/repos/auth_repo.dart';
import 'package:fusion/halper/Textfield.dart';
import 'package:fusion/screens/auth_screens/login_screen.dart';
import 'package:fusion/screens/home/Choose_a_Restaurant.dart';
import 'package:fusion/utils/helper_widget.dart';
import 'package:fusion/utils/navigator.dart';
import 'package:provider/provider.dart';

class AuthProvider with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool logOutLoading = false;
  bool loginLoading = false;

  Future<void> googleLogin(BuildContext context) async {
    try {
      await AuthRepo.signInWithGoogleAndAddToFirestore();

      /// save user is login
      await localStorage.setUserLogin(true);
      pushTo(context, const ChooseRestaurant());
    } catch (e, s) {
      print('googleLogin: ${e.toString() + s.toString()}');
    }
  }

  void logOut(BuildContext context) async {
    try {
      logOutLoading = true;
      notifyListeners();
      await AuthRepo.signOut();
      logOutLoading = false;
      notifyListeners();

      /// save user is login
      await localStorage.setUserLogin(false);
      pushAndRemoveUntil(context, LoginScreen());
    } catch (e, s) {
      logOutLoading = false;
      notifyListeners();
      print('logOut: ${e.toString() + s.toString()}');
    }
  }

  void login(BuildContext context) async {
    try {
      loginLoading = true;
      notifyListeners();
      await AuthRepo.login(
        email: emailController.text,
        password: passwordController.text,
      );
      loginLoading = false;
      notifyListeners();

      /// save user is login
      await localStorage.setUserLogin(true);
      pushAndRemoveUntil(context, ChooseRestaurant());
    } catch (e, s) {
      loginLoading = false;
      notifyListeners();
      print('Login : ${e.toString() + s.toString()}');
    }
  }
}
