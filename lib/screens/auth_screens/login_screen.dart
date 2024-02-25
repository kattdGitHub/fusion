import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
import 'package:fusion/utils/app_btn.dart';
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
                    const Text(
                      "Email ",
                      style: TextStyle(
                        fontFamily: "Jost",
                        fontSize: 14.689654350280762,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff777777),
                        height: 21 / 14.689654350280762,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    TextFormField(
                      controller: provider.emailController,
                      validator: AppValidator.validateEmail,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Password",
                      style: TextStyle(
                        fontFamily: "Jost",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff777777),
                        height: 20 / 14,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    TextFormField(
                      controller: provider.passwordController,
                      validator: AppValidator.validatePassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(CupertinoIcons.eye_slash),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            pushTo(context, ForgotPassword());
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontFamily: "Jost",
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff777777),
                              height: 19 / 13,
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
                        // pushTo(context, const ChooseRestaurant());
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
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
                    child: const Text(
                      "Register ",
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
    );
  }
}
