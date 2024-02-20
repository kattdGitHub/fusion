import 'package:firebase/Screen_All/forgot%20password.dart';
import 'package:firebase/Screen_All/home_page.dart';
import 'package:firebase/halper/Textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'SignUp.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController Emailcontroller = TextEditingController();

  TextEditingController PassWordcontroller = TextEditingController();

  login(String email, String password, context) async {
    if (email == "" && password == "") {
      return uihlper.CustomAleriBox(context, "Enter Requried Fields");
    } else {
      try {
        UserCredential? userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      } on FirebaseAuthException catch (ex) {
        return uihlper.CustomAleriBox(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          "LoigePage",
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
              login(
                Emailcontroller.text.toString(),
                PassWordcontroller.text.toString(),
                context,
              );
            },
            "Login",
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already Hava an Acoount??",
                style: TextStyle(fontSize: 15),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SingUp(),
                    ),
                  );
                },
                child: Text(
                  "SignUp",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ForgotPassWord(),
                ),
              );
            },
            child: Text(
              "ForgotPassword??",
              style: TextStyle(color: Colors.deepPurple, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
