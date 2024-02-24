import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fusion/business_logic/repos/auth_repo.dart';
import 'package:fusion/screens/home/Choose_a_Restaurant.dart';
import 'package:fusion/utils/navigator.dart';
import 'package:provider/provider.dart';

class AuthProvider with ChangeNotifier{
  Future<void> googleLogin(BuildContext context) async {
    try {
     await AuthRepo.signInWithGoogleAndAddToFirestore();
     pushTo(context, const ChooseRestaurant());
    } catch (e, s) {
      print(
          'googleLogin: ${e.toString() + s.toString()}');
    }
  }
}
