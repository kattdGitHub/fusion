import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusion/Theme/theme.dart';
import 'package:fusion/business_logic/providers/auth_provider.dart';
import 'package:fusion/dashboard/Dashboard.dart';
import 'package:fusion/halper/image_helper.dart';
import 'package:fusion/screens/auth_screens/login_screen.dart';
import 'package:fusion/screens/auth_screens/verification.dart';
import 'package:fusion/utils/CustomTextField.dart';
import 'package:fusion/utils/app_btn.dart';
import 'package:fusion/utils/app_validator.dart';
import 'package:fusion/utils/navigator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final firstName = TextEditingController(text: "Jone");
  final lastName = TextEditingController(text: "Smith");
  final phoneNumber = TextEditingController(text: "+919877518837");
  final emailController = TextEditingController(text: "Jone@gmail.com");
  final passwordController = TextEditingController(text: "12345678");
  final confirmPasswordController = TextEditingController(text: "12345678");

  SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Set Up Your Profile!"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Consumer<UserProvider>(builder: (context, provider, child) {
              return Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          child: provider.pickedImage != null
                              ? CircleAvatar(
                            radius: 60.r,
                            backgroundImage: FileImage(provider.pickedImage!),
                          )
                              : CircleAvatar(
                            backgroundColor: AppColors.primaryColor,
                            radius: 60.r,
                            child: SafeArea(
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 80.sp,
                              ),
                            ),
                          ),
                          onTap: () {
                            showImageDialog(
                              context,
                              onTapCamera: () => provider.pickImage(ImageSource.camera),
                              onTapGallery: () => provider.pickImage(ImageSource.gallery),
                            );
                          },
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "First Name",
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
                      validator: AppValidator.nameValidator,
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
                      validator: AppValidator.lastValidator,
                      controller: lastName,
                    ),
                    const Row(
                      children: [
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
                      ],
                    ),
                    AppTextField(
                      controller: phoneNumber,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
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
                      controller: emailController,
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
                      decoration: const InputDecoration(
                        suffixIcon: Icon(CupertinoIcons.eye_slash),
                        border: OutlineInputBorder(),
                      ),
                      validator: AppValidator.passwordValidator,
                      controller: passwordController,
                    ),
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Confirm password",
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
                      decoration: const InputDecoration(
                        suffixIcon: Icon(CupertinoIcons.eye_slash),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        return AppValidator.confirmPasswordValidator(
                            value, passwordController.text);
                      },
                      controller: confirmPasswordController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'I have read and agree to the ',
                            style: TextStyle(
                              color: const Color(0xFF777777),
                              fontSize: 14.sp,
                              fontFamily: 'Jost',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: 'Privacy Policy ',
                            style: TextStyle(
                              color: const Color(0xFFBD8D46),
                              fontSize: 14.sp,
                              fontFamily: 'Jost',
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: 'and ',
                            style: TextStyle(
                              color: const Color(0xFF777777),
                              fontSize: 14.sp,
                              fontFamily: 'Jost',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: 'Terms and Conditions',
                            style: TextStyle(
                              color: const Color(0xFFBD8D46),
                              fontSize: 12.sp,
                              fontFamily: 'Jost',
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.w),
                    AppBtn(
                      isLoading: provider.registerLoading,
                      title: "Continue",
                      width: 0.8,
                      onPressed: () {
                        if (formKey.currentState?.validate() == false) return;
                        provider.createUser(
                          context: context,
                          firstName: firstName,
                          lastName: lastName,
                          phoneNumber: phoneNumber,
                          emailController: emailController,
                          passwordController: passwordController,
                          confirmPasswordController: confirmPasswordController,
                        );
                      },
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    Padding(
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
                                      pushReplacement(context, LoginScreen());
                                    },
                                    child: const Text(
                                      "Log in",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: CupertinoColors.systemBlue,
                                      ),
                                    ),
                                  ),
                                ),
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
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}
