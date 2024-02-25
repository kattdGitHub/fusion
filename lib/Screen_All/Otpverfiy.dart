import 'dart:math';
import 'package:fusion/Screen_All/home_pageNew.dart';
import 'package:fusion/halper/Textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OtpVerfiy extends StatelessWidget {
  String verificationId;

  OtpVerfiy({super.key, required this.verificationId});

  @override
  Widget build(BuildContext context) {
    TextEditingController Otpcontroller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "OTPVerfiy",
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.customTextField(
            Otpcontroller,
            "Enter OTP",
            Icons.scatter_plot_outlined,
            true,
          ),
          SizedBox(
            height: 30,
          ),
          UiHelper.customButton(
            () async {
              try {
                PhoneAuthCredential credential =
                    await PhoneAuthProvider.credential(
                        verificationId: verificationId,
                        smsCode: Otpcontroller.text.toString());
                FirebaseAuth.instance.signInWithCredential(credential).then(
                      (value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      ),
                    );
              } catch (ex) {
                print(ex.toString());
              }
            },
            "Verfiy",
          ),
        ],
      ),
    );
  }
}
