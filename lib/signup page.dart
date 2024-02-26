import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusion/Theme/theme.dart';
import 'package:fusion/halper/Textfield.dart';

import 'package:fusion/halper/image_helper.dart';
import 'package:fusion/business_logic/providers/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  singup(AddUserProvider provider) async {
    File? pickedImage = provider.pickedImage;
    String email = provider.emailController.text;
    String password = provider.passwordController.text;
    if (email.isEmpty || password.isEmpty || pickedImage == null) {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Enter Required Fields"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("ok"),
            ),
          ],
        ),
      );
    } else {
      provider.createUser(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          "Sign Up Page",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.indigo.shade500,
      body: SingleChildScrollView(
        child: Consumer<AddUserProvider>(builder: (context, provider, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 50.h),
              InkWell(
                child: provider.pickedImage != null
                    ? CircleAvatar(
                        radius: 80.r,
                        backgroundImage: FileImage(provider.pickedImage!),
                      )
                    : CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                        radius: 80.r,
                        child: SafeArea(
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 100.sp,
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
              SizedBox(
                height: 40,
              ),
              UiHelper.customTextField(
                provider.emailController,
                "Email",
                Icons.email,
                false,
              ),
              SizedBox(
                height: 20,
              ),
              UiHelper.customTextField(
                provider.passwordController,
                "Password",
                Icons.password,
                true,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          );
        }),
      ),
      bottomNavigationBar:
          Consumer<AddUserProvider>(builder: (context, provider, child) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: UiHelper.customButton(
            () {
              singup(provider);
            },
            "Sign Up ",
          ),
        );
      }),
    );
  }
}
