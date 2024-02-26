import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusion/Password/Forgot_Password.dart';
import 'package:fusion/Restaurant/restaurant.dart';
import 'package:fusion/app_config/app_config.dart';
import 'package:fusion/business_logic/providers/auth_provider.dart';
import 'package:fusion/business_logic/repos/auth_repo.dart';
import 'package:fusion/dashboard/Dashboard.dart';
import 'package:fusion/halper/Textfield.dart';
import 'package:fusion/screens/auth_screens/splash.dart';
import 'package:fusion/screens/home/Choose_a_Restaurant.dart';
import 'package:fusion/screens/home/restaurant_home_page.dart';
import 'package:fusion/screens/sign_up.dart';
import 'package:fusion/utils/CustomTextField.dart';
import 'package:fusion/utils/app_btn.dart';
import 'package:fusion/utils/app_validator.dart';
import 'package:fusion/utils/navigator.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SafeArea(
          child: Consumer<AuthProvider>(builder: (context, provider, child) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 60.h,
                        ),
                        Text(
                          "Welcome Back",
                          style: TextStyle(
                            fontFamily: "Jost",
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff0c0c0c),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                            height: 30,
                            child: Image(
                                image: AssetImage(
                              "assets/image/waving-hand 1.png",
                            )))
                      ],
                    ),
                    Text(
                      "Please sign in to continue. ",
                      style: TextStyle(
                        fontFamily: "Jost",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff777777),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 50.h,
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
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Password',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Jost',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    AppTextField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(CupertinoIcons.eye_slash),
                        border: OutlineInputBorder(),
                      ),
                      validator: AppValidator.passwordValidator,
                      controller: provider.passwordController,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            pushTo(context, ForgotPassword());
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: CupertinoColors.systemBlue,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppBtn(
                      isLoading: provider.loginLoading,
                      style: const TextStyle(color: Colors.white),
                      title: 'Login',
                      onPressed: () {
                        if (formKey.currentState?.validate() == false) return;
                        provider.login(context);
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              provider.googleLogin(context);
                            },
                            child: const Image(
                              image: AssetImage(
                                  "assets/image/google_icon-icons.com_62736 (1) 1.png"),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                text: "Don’t have an account? ",
                children: [
                  WidgetSpan(
                    child: InkWell(
                      onTap: () {
                        pushTo(context, SignUp());
                      },
                      child: Text(
                        "Register ",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: CupertinoColors.systemBlue,
                        ),
                      ),
                    ),
                  ),
                ],
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
