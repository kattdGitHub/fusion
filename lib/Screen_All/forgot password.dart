import 'package:firebase/halper/Textfield.dart';
import 'package:flutter/material.dart';

class ForgotPassWord extends StatefulWidget {
  const ForgotPassWord({super.key});

  @override
  State<ForgotPassWord> createState() => _ForgotPassWordState();
}

class _ForgotPassWordState extends State<ForgotPassWord> {
  TextEditingController Emailcontroller = TextEditingController();

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



          uihlper.CustomTextField(
            Emailcontroller,
            "Email",
            Icons.email,
            false,
          ),
          SizedBox(
            height: 30,
          ),
          uihlper.CustomButton(
            () {},
            "ForgotPassword",
          )
        ],
      ),
    );
  }
}
