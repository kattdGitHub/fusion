import 'package:fusion/Screen_All/home_pageNew.dart';
import 'package:flutter/material.dart';
import 'package:fusion/halper/Textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SingUp extends StatelessWidget {
  const SingUp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController Emailcontroller = TextEditingController();
    TextEditingController PassWordcontroller = TextEditingController();
    signUp(String email, String password) async {
      if (email == "" && password == "") {
        UiHelper.customAlertBox(context, "Enter Required Fields");
      } else {
        try {
          UserCredential? userCredential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        } on FirebaseAuthException catch (ex) {
          return UiHelper.customAlertBox(context, ex.code.toString());
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          "Sign Up Page",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Jost",
            color: Colors.white,
          ),
        ),
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
          UiHelper.customTextField(
            PassWordcontroller,
            "Password",
            Icons.password,
            true,
          ),
          SizedBox(
            height: 50,
          ),
          UiHelper.customButton(
            () {
              signUp(
                Emailcontroller.text.toString(),
                PassWordcontroller.text.toString(),
              );
            },
            "Sign Up",
          ),
        ],
      ),
    );
  }
}
