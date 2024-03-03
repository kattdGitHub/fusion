import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusion/Password/One_Time_Password.dart';
import 'package:fusion/business_logic/providers/auth_provider.dart';
import 'package:fusion/utils/CustomTextField.dart';
import 'package:fusion/utils/app_btn.dart';
import 'package:fusion/utils/app_validator.dart';
import 'package:fusion/utils/navigator.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forgot Password",
          style: TextStyle(
            fontFamily: "Jost",
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.left,
        ),
      ),
      body: Consumer<UserProvider>(
        builder: (context, provider, child) {
          return Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Center(
                    child: Text(
                      "We sent you a code to verify your account.",
                      style: TextStyle(
                        fontFamily: "Jost",
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff777777),
                        height: 23 / 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                            fontFamily: "Jost",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 20 / 14,
                          ),
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                  ),
                  AppTextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    validator: AppValidator.emailValidator,
                    controller: provider.emailController,
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  AppBtn(
                    onPressed: () {
                      if (formKey.currentState?.validate() == false) return;
                      provider.resetPassword(context);
                    },
                    title: "Continue",
                    style: const TextStyle(
                      fontFamily: "Jost",
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xfff7f5f5),
                      height: 26 / 18,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
