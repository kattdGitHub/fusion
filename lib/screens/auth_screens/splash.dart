import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fusion/dashboard/Dashboard.dart';
import 'package:fusion/screens/auth_screens/login_screen.dart';
import 'package:fusion/screens/home/restaurant_home_page.dart';
import 'package:fusion/utils/font_faimly.dart';
import 'package:fusion/utils/navigator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () async {
        await FirebaseAuth.instance.signOut();
        if(FirebaseAuth.instance.currentUser==null) {
          pushAndRemoveUntil(context, LoginScreen());
        }{
          pushAndRemoveUntil(context, Dashboard());
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child:
                  Image(image: AssetImage("assets/image/Reserva logo 2 1.png")),
            ),
            Text(
              " Your Table, Our Pleasure!",
              style: TextStyle(
                color: Color(0xFF1B1B1B),
                fontSize: 29.74,
                fontFamily: AppFont.yellowtailRegular,
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
