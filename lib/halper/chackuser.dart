import 'package:firebase/Screen_All/LoginScreen.dart';
import 'package:firebase/Screen_All/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class CheckUser extends StatelessWidget {
  const CheckUser({super.key});

  @override
  Widget build(BuildContext context) {
    return chackuser();
  }
}

chackuser() {
  final User = FirebaseAuth.instance.currentUser;
  if (User != null) {
    return HomePage();
  } else {
    return LoginScreen();
  }
}
