import 'dart:convert';
import 'package:fusion/halper/image_helper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fusion/business_logic/models/usermodel.dart';
import 'package:fusion/business_logic/providers/auth_provider.dart';
import 'package:fusion/business_logic/repos/auth_repo.dart';
import 'package:fusion/utils/app_btn.dart';
import 'package:fusion/utils/error_box.dart';
import 'package:fusion/utils/navigator.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  final UserModel userModel;

  const EditProfile({super.key, required this.userModel});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final formKey = GlobalKey<FormState>();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();
  final countryCode = TextEditingController();
  final dialCode = TextEditingController();
  final imageUrlController = TextEditingController();

  @override
  void initState() {
    firstName.text = widget.userModel.firstName ?? "";
    lastName.text = widget.userModel.lastName ?? "";
    phoneNumber.text = widget.userModel.phoneNumber ?? "";
    countryCode.text = widget.userModel.countryCode ?? "";
    dialCode.text = widget.userModel.dialCode ?? "";
    imageUrlController.text = widget.userModel.image ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Profile",
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<int>(
            onSelected: (value) {
              if (value == 0) {
                showLogOutDialog(context);
              } else if (value == 1) {
                showDeleteDialog(context);
              } else {
                showToast(text: "Coming soon");
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(
                value: 0,
                child: Text('Logout'),
              ),
              const PopupMenuItem(
                value: 1,
                child: Text('Delete'),
              ),
            ],
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: Consumer<UserProvider>(
          builder: (context, provider, child) {
            final userModel = widget.userModel;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            showImageDialog(
                              context,
                              onTapCamera: () =>
                                  provider.pickImage(ImageSource.camera),
                              onTapGallery: () =>
                                  provider.pickImage(ImageSource.gallery),
                            );
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: getDecorationImage(provider),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "Edit picture",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Frist Name",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontFamily: "Jons"),
                      ),
                    ),
                    TextFormField(
                      controller: firstName,
                      decoration: const InputDecoration(
                        hintText: "Frist Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Last Name",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontFamily: "Jons"),
                      ),
                    ),
                    TextFormField(
                      controller: lastName,
                      decoration: const InputDecoration(
                        hintText: "Last Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          top: 20, right: 8.0, left: 8.0, bottom: 8.0),
                      child: Text(
                        "Phone Number",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontFamily: "Jons"),
                      ),
                    ),
                    IntlPhoneField(
                      controller: phoneNumber,
                      decoration: const InputDecoration(
                        hintText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(),
                        ),
                      ),
                      languageCode: "en",
                      initialCountryCode: userModel.countryCode,
                      onCountryChanged: (country) {
                        countryCode.text = country.code;
                        dialCode.text = country.dialCode;
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    AppBtn(
                      title: "Save",
                      onPressed: () {
                        provider.updateProfile(
                          context: context,
                          firstName: firstName.text,
                          lastName: lastName.text,
                          dialCode: dialCode.text,
                          countryCode: countryCode.text,
                          phoneNumber: phoneNumber.text,
                          imageFile: provider.pickedImage,
                        );
                      },
                      isLoading: provider.updateProfileLoading,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  DecorationImage? getDecorationImage(UserProvider provider) {
    if (provider.pickedImage != null) {
      return DecorationImage(
        fit: BoxFit.fill,
        image: FileImage(
          provider.pickedImage!,
        ),
      );
    }else if (imageUrlController.text.isNotEmpty) {
      return DecorationImage(
        fit: BoxFit.fill,
        image: NetworkImage(
          imageUrlController.text,
        ),
      );
    }   else {
      return null;
    }
  }

  void showLogOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text("Are you sure ?"),
          actions: [
            Consumer<UserProvider>(
              builder: (context, provider, child) {
                return AppBtn(
                  onPressed: () {
                    provider.logOut(context);
                  },
                  width: 0.5,
                  isLoading: provider.logOutLoading,
                  title: "Yes",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  color: Colors.green,
                );
              },
            ),
            const SizedBox(height: 10),
            AppBtn(
              onPressed: () {
                back(context);
              },
              title: "No",
              width: 0.5,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              color: Colors.green,
            )
          ],
        );
      },
    );
  }

  void showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Account'),
          content: const Text("Are you sure ?"),
          actions: [
            Consumer<UserProvider>(
              builder: (context, provider, child) {
                return AppBtn(
                  onPressed: () {
                    provider.deleteAccount(context);
                  },
                  isLoading: provider.deleteLoading,
                  title: "Yes",
                  width: 0.5,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  color: Colors.green,
                );
              },
            ),
            const SizedBox(height: 10),
            AppBtn(
              onPressed: () {
                back(context);
              },
              title: "No",
              width: 0.5,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              color: Colors.green,
            )
          ],
        );
      },
    );
  }
}
