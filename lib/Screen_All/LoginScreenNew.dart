import 'package:fusion/Screen_All/forgot%20password.dart';
import 'package:fusion/Screen_All/home_pageNew.dart';
import 'package:fusion/halper/Textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'SignUpNew.dart';

class LoginScreenNew extends StatefulWidget {
  const LoginScreenNew({super.key});

  @override
  State<LoginScreenNew> createState() => _LoginScreenNewState();
}

class _LoginScreenNewState extends State<LoginScreenNew> {
  TextEditingController Emailcontroller = TextEditingController();

  TextEditingController PassWordcontroller = TextEditingController();

  login(String email, String password, context) async {
    if (email == "" && password == "") {
      return UiHelper.customAlertBox(context, "Enter Requried Fields");
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
        return UiHelper.customAlertBox(context, ex.code.toString());
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
