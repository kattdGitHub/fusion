    import 'package:firebase/halper/Textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassWord extends StatefulWidget {
  const ForgotPassWord({super.key});

  @override
  State<ForgotPassWord> createState() => _ForgotPassWordState();
}

class _ForgotPassWordState extends State<ForgotPassWord> {
  TextEditingController Emailcontroller = TextEditingController();

  forgotPassword(String email) {
    if (email == "") {
      return UiHelper.customAlertBox(
          context, "Enter an Email To Reset Password");
    } else {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ForgotPassword"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          UiHelper.customTextField(
            Emailcontroller,
            "Email",
            Icons.email,
            false,
          ),
          SizedBox(
            height: 30,
          ),
          UiHelper.customButton(
            () {
              forgotPassword(
                Emailcontroller.text.toString(),
              );
            },
            "ResetPassword",
          )
        ],
      ),
    );
  }
}
