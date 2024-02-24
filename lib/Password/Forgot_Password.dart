import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fusion/Password/One_Time_Password.dart';
import 'package:fusion/utils/app_btn.dart';
import 'package:fusion/utils/navigator.dart';

class ForgotPassword extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text(
          "Forgot Password",
          style: const TextStyle(
            fontFamily: "Jost",
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color(0xff000000),
            height: 29 / 20,
          ),
          textAlign: TextAlign.left,
        ),
      )),
      key: formKey,
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Center(
            child: Text(
              "We sent you a code to verify your account.",
              style: const TextStyle(
                fontFamily: "Jost",
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Color(0xff777777),
                height: 23 / 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Email or Phone Number",
                    style: const TextStyle(
                      fontFamily: "Jost",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff777777),
                      height: 20 / 14,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 90,
          ),
          AppBtn(
            onPressed: () {
              pushTo(context, OneTimePassword());
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
