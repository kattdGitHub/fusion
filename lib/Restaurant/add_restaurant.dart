import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fusion/Savebth/savebtn.dart';
import 'package:fusion/app_config/app_config.dart';
import 'package:fusion/business_logic/providers/provider.dart';
import 'package:fusion/halper/image_helper.dart';
import 'package:fusion/utils/app_btn.dart';
import 'package:image_picker/image_picker.dart';

import 'package:provider/provider.dart';

class AddRestaurant extends StatelessWidget {
  AddRestaurant({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController openTimeController = TextEditingController();
  final TextEditingController closeTimeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController documentUrlController = TextEditingController();

  Future<void> saveRestaurantDetails(BuildContext context) async {
    try {
      String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
      DocumentReference restaurantRef =
          await FirebaseFirestore.instance.collection('restaurants').add({
        'name': nameController.text,
        'userId': userId,
        'location': locationController.text,
        'phoneNumber': phoneNumberController.text,
        'website': websiteController.text,
        'openTime': openTimeController.text,
        'closeTime': closeTimeController.text,
        'description': descriptionController.text,
      });
      uploadData(pickedImage);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RestaurantMadlyan()),
      );

      print('Restaurant details saved successfully');
    } catch (error) {
      print('Error saving restaurant details: $error');
      // Handle errors as needed
    }
  }

  uploadData(PickedFile pickedImage) async {
    UploadTask uploadTask = FirebaseStorage.instance
        .ref("Restaurant Pics")
        .child(nameController.text.toString())
        .putFile(pickedImage);
    TaskSnapshot taskSnapshot = await uploadTask;
    String uri = await taskSnapshot.ref.getDownloadURL();
    FirebaseFirestore.instance
        .collection("restaurant")
        .doc(nameController.text.toString())
        .set({
      "Name": nameController.text.toString(),
      "Image": uri,
    }).then((value) {
      log("restaurant Uploaded");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddUserProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Restaurant",
            style: TextStyle(
              fontFamily: "Jost",
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xff000000),
              height: 29 / 20,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Name of the Restaurant",
                    style: TextStyle(
                      fontFamily: "Jost",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff777777),
                      height: 17 / 12,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'name',
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Location",
                    style: TextStyle(
                      fontFamily: "Jost",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff777777),
                      height: 17 / 12,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: locationController,
                    decoration: InputDecoration(
                      hintText: 'Location',
                      suffixIcon: Icon(Icons.location_on_outlined),
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Phone Number",
                    style: TextStyle(
                      fontFamily: "Jost",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff777777),
                      height: 17 / 12,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: phoneNumberController,
                    decoration: InputDecoration(
                      hintText: 'Phone Number',
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Website",
                    style: TextStyle(
                      fontFamily: "Jost",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff777777),
                      height: 17 / 12,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: websiteController,
                    decoration: InputDecoration(
                      hintText: 'Website',
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Add Cuisines ",
                    style: TextStyle(
                      fontFamily: "Jost",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff777777),
                      height: 17 / 12,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: DropdownSearch<String>.multiSelection(
                    items: [
                      "Brazil",
                      "Italia (Disabled)",
                      "Tunisia" "Brazil",
                      "Italia (Disabled)",
                      "Tunisia",
                      'Canada'
                    ],
                    popupProps: PopupPropsMultiSelection.menu(
                      showSelectedItems: true,
                    ),
                    onChanged: print,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Business Hours",
                    style: TextStyle(
                      fontFamily: "Jost",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff777777),
                      height: 17 / 12,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  height: 60,
                  width: AppConfig.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: openTimeController,
                            style: TextStyle(
                              fontFamily: "Open Time",
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff979797),
                              height: 16 / 12,
                            ),
                            decoration: InputDecoration(
                              labelText: 'Open Time',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: closeTimeController,
                            style: TextStyle(
                              fontFamily: "Close Time",
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff979797),
                              height: 16 / 12,
                            ),
                            decoration: InputDecoration(
                              labelText: 'Close Time',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Description",
                    style: TextStyle(
                      fontFamily: "Jost",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff777777),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: descriptionController,
                    maxLines: 7,
                    decoration: InputDecoration(
                      enabled: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Add Restaurant Images/Video",
                    style: TextStyle(
                      fontFamily: "Jost",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff777777),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                InkWell(
                  onTap: () {
                    showImageDialog(
                      context,
                      onTapCamera: () => provider.pickImage(ImageSource.camera),
                      onTapGallery: () =>
                          provider.pickImage(ImageSource.gallery),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: Radius.circular(12),
                      padding: EdgeInsets.all(6),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        child: SizedBox(
                          height: 200,
                          width: AppConfig.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  // controller: imageUrlController, // Remove this line
                                  decoration: InputDecoration(
                                    hintText: 'Image URL',
                                    contentPadding: EdgeInsets.all(10),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              Text(
                                "Choose file to upload Image",
                                style: TextStyle(
                                  fontFamily: "Jost",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff777777),
                                  height: 16 / 12,
                                ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),

                          // ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Document and Verification",
                    style: TextStyle(
                      fontFamily: "Jost",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff777777),
                      height: 17 / 12,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(12),
                    padding: EdgeInsets.all(6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image(
                                image: AssetImage(
                                  "assets/image/file .png",
                                ),
                              ),
                            ),
                            Text(
                              "Upload Document",
                              style: TextStyle(
                                fontFamily: "Jost",
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff777777),
                                height: 16 / 12,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                        height: 200,
                        width: AppConfig.width,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(8.0),
          child: AppBtn(
            title: "Save",
            style: TextStyle(
              fontFamily: "Jost",
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.white,
              height: 26 / 18,
            ),
            onPressed: () {
              saveRestaurantDetails(context);
            },
          ),
        ),
      );
    });
  }
}
