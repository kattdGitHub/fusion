import 'package:flutter/material.dart';
import 'package:fusion/Password/Reset_Password.dart';
import 'package:fusion/screens/home/location.dart';
import 'package:fusion/utils/navigator.dart';

class OneTimePassword extends StatelessWidget {
  const OneTimePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("One Time Password"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 45,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Didn’t receive OTP?",
                style: const TextStyle(
                  fontFamily: "Jost",
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff777777),
                  height: 20 / 14,
                ),
                textAlign: TextAlign.left,
              ),
              InkWell(
                  onTap: () {
                    pushTo(context, Reset_Password());
                  },
                  child: const Text(
                    "Resend",
                    style: TextStyle(
                      fontFamily: "Jost",
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffbd8d46),
                      height: 26 / 18,
                    ),
                    textAlign: TextAlign.left,
                  ))
            ],
          ),
          Container(
            child: Text(
              "Please Enter the 4-digit Verification Code Sent to johnsmith@gmail.com",
              style: const TextStyle(
                fontFamily: "Jost",
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                height: 46 / 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 4; i++)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13.0),
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Jost",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff777777),
                        height: 17 / 12,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            '(35 Sec)',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF8E8E8E),
              fontSize: 14,
              fontFamily: 'Jost',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}
