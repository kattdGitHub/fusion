import 'dart:developer';
import 'dart:io';

import 'package:firebase/halper/Textfield.dart';
import 'package:firebase/halper/firebase_repo.dart';
import 'package:firebase/halper/image_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  File? pickedImage;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            InkWell(
              child: pickedImage != null
                  ? CircleAvatar(
                      radius: 80,
                      backgroundImage: FileImage(pickedImage!),
                    )
                  : CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      radius: 80,
                      child: SafeArea(
                        child: Icon(
                          Icons.person_off_sharp,
                          color: Colors.white,
                          size: 100,
                        ),
                      ),
                    ),
              onTap: () {
                showImageDialog(
                  context,
                  onTapCamera: () => pickImage(ImageSource.camera),
                  onTapGallery: () => pickImage(ImageSource.gallery),
                );
              },
            ),
            SizedBox(
              height: 40,
            ),
            UiHelper.customTextField(
              emailController,
              "Email",
              Icons.email,
              false,
            ),
            SizedBox(
              height: 20,
            ),
            UiHelper.customTextField(
              passwordController,
              "Password",
              Icons.password,
              true,
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: UiHelper.customButton(
          () {
            if (pickedImage != null) uploadImageFirebase("0008", pickedImage!);
          },
          "Sign Up ",
        ),
      ),
    );
  }

  pickImage(ImageSource imageSource) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageSource);
      if (photo == null) return;
      setState(() {
        pickedImage = File(photo.path);
      });
    } catch (ex) {
      log(ex.toString());
    }
  }
}
