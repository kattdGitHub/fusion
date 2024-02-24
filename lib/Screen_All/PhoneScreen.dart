import 'package:firebase/Screen_All/Otpverfiy.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController PhoneController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Phoneauth"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: TextField(
              controller: PhoneController,

              decoration: InputDecoration(
                hintText: "Enter Phone Number",
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
                suffix: Icon(
                  Icons.phone,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.verifyPhoneNumber(
                verificationCompleted: (PhoneAuthCredential credential) {},
                verificationFailed: (FirebaseAuthException ex) {},
                codeSent: (String verificationId, int? resendingToken) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OtpVerfiy(verificationId: verificationId),
                    ),
                  );
                },
                codeAutoRetrievalTimeout: (String verificationId) {},
                phoneNumber: PhoneController.text.toString(),
              );
            },
            child: Text(
              "Verfiy Phone Number",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                Colors.deepPurple,
              ),
            ),
          )
        ],
      ),
    );
  }
}
