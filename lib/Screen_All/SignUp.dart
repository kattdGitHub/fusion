import 'package:firebase/Screen_All/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase/halper/Textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SingUp extends StatelessWidget {
  const SingUp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController Emailcontroller = TextEditingController();
    TextEditingController PassWordcontroller = TextEditingController();
    signUp(String email, String password) async {
      if (email == "" && password == "") {
        uihlper.CustomAleriBox(context, "Enter Required Fields");
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
          return uihlper.CustomAleriBox(context, ex.code.toString());
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
          uihlper.CustomTextField(
            Emailcontroller,
            "Email",
            Icons.email,
            false,
          ),
          SizedBox(
            height: 30,
          ),
          uihlper.CustomTextField(
            PassWordcontroller,
            "Password",
            Icons.password,
            true,
          ),
          SizedBox(
            height: 50,
          ),
          uihlper.CustomButton(
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
