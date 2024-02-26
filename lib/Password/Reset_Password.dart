import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fusion/screens/auth_screens/login_screen.dart';

import 'package:fusion/utils/app_btn.dart';
import 'package:fusion/utils/navigator.dart';

class Reset_Password extends StatelessWidget {
  const Reset_Password({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Reset Password",
          style: TextStyle(
            fontFamily: "Jost",
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color(0xff000000),
            height: 29 / 20,
          ),
          textAlign: TextAlign.left,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "New Password",
                    style: const TextStyle(
                      fontFamily: "Jost",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff777777),
                      height: 20 / 14,
                    ),
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(CupertinoIcons.eye_slash),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Confirm Password",
                    style: const TextStyle(
                      fontFamily: "Jost",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff777777),
                      height: 20 / 14,
                    ),
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(CupertinoIcons.eye_slash),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 151,
          ),
          AppBtn(
            onPressed: () {
               pushTo(context,LoginScreen());
            },
            title: "Continue",
            style: const TextStyle(
              fontFamily: "Jost",
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xfff7f5f5),
              height: 26 / 18,
            ),
          )
        ],
      ),
    );
  }
}
