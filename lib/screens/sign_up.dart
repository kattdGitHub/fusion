import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fusion/dashboard/Dashboard.dart';
import 'package:fusion/screens/auth_screens/login_screen.dart';
import 'package:fusion/screens/auth_screens/verification.dart';
import 'package:fusion/utils/CustomTextField.dart';
import 'package:fusion/utils/app_btn.dart';
import 'package:fusion/utils/app_validator.dart';
import 'package:fusion/utils/navigator.dart';

class SignUp extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final firstName = TextEditingController();
  final lastName = TextEditingController();

  SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 45),
                  const Text("Set Up Your Profile!",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      )),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("First Name",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                  ),
                  AppTextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    validator: AppValidator.emailValidator,
                    controller: firstName,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Last Name",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppTextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    controller: lastName,
                  ),
                  const Row(children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Phone',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Jost',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ]),
                  AppTextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(children: [
                      Text(
                        "E-mail",
                        style: TextStyle(
                          fontFamily: "Jost",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 20 / 14,
                        ),
                        textAlign: TextAlign.left,
                      )
                    ]),
                  ),
                  AppTextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const Text(
                    "Password",
                    style: TextStyle(
                      fontFamily: "Jost",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 20 / 14,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(CupertinoIcons.eye_slash),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const Text(
                    "Confirm password",
                    style: TextStyle(
                      fontFamily: "Jost",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 20 / 14,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(CupertinoIcons.eye_slash),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 14,
                        height: 14,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 0.81, color: Color(0xFF777777)),
                            borderRadius: BorderRadius.circular(2.44),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: const SizedBox(
                          width: 312,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'I have read and agree to the ',
                                  style: TextStyle(
                                    color: Color(0xFF777777),
                                    fontSize: 12,
                                    fontFamily: 'Jost',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Privacy Policy ',
                                  style: TextStyle(
                                    color: Color(0xFFBD8D46),
                                    fontSize: 12,
                                    fontFamily: 'Jost',
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.underline,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: 'and ',
                                  style: TextStyle(
                                    color: Color(0xFF777777),
                                    fontSize: 12,
                                    fontFamily: 'Jost',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Terms and Conditions',
                                  style: TextStyle(
                                    color: Color(0xFFBD8D46),
                                    fontSize: 12,
                                    fontFamily: 'Jost',
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.underline,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  AppBtn(
                    title: "Continue",
                    width: 0.9,
                    // height: ,
                    onPressed: () {
                      pushTo(context, const Verification());
                    },
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text.rich(
                TextSpan(
                  text: "Already Account? ",
                  children: [
                    WidgetSpan(
                        child: InkWell(
                      onTap: () {
                        pushTo(context, const Dashboard());
                      },
                      child: const Text(
                        "Log in",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: CupertinoColors.systemBlue),
                      ),
                    )),
                    // TextSpan(
                    //   text: "Register",
                    //   recognizer: TapGestureRecognizer()..onTap = () {},
                    //   style: TextStyle(
                    //       fontSize: 14,
                    //       fontWeight: FontWeight.bold,
                    //       color: CupertinoColors.systemBlue),
                    // ) ,
                  ],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
