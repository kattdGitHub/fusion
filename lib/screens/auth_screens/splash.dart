import 'package:flutter/material.dart';
import 'package:fusion/screens/auth_screens/login_screen.dart';
import 'package:fusion/utils/font_faimly.dart';
import 'package:fusion/utils/navigator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
            (route) => false);
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
