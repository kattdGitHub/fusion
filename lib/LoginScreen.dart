import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Vx.gray900,
        title: Text(
          "LoigeScreen",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Jost",
              color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Vx.gray900,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8, bottom: 4, top: 8, right: 8),
              child: Text(
                "Email",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Jost",
                    color: Colors.white),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8, bottom: 8, top: 4, right: 8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter Email",
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8, bottom: 4, top: 8, right: 8),
              child: Text(
                "Password",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Jost",
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8, bottom: 8, top: 4, right: 8),
              child: TextField(
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: "Enter Password",
                  suffix: Icon(
                    Icons.remove_red_eye_outlined,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Center(
              child: ElevatedButton(autofocus: true,
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.blueAccent)),
                  onPressed: () {},
                  child: Container(height: 45,width: 220,
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),textAlign: TextAlign.center,
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
