import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fusion/Savebth/savebtn.dart';
import 'package:fusion/app_config/app_config.dart';
import 'package:fusion/utils/app_btn.dart';
import 'package:fusion/utils/navigator.dart';

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

  // Function to save restaurant details to Firestore
  Future<void> saveRestaurantDetails() async {
    try {
      String name = nameController.text;
      String location = locationController.text;
      String phoneNumber = phoneNumberController.text;
      String website = websiteController.text;
      String openTime = openTimeController.text;
      String closeTime = closeTimeController.text;
      String description = descriptionController.text;
      String imageUrl = imageUrlController.text;
      String documentUrl = documentUrlController.text;
      String? userId = FirebaseAuth.instance.currentUser?.uid;

      // Save restaurant details to Firestore
      DocumentReference restaurantRef =
      await FirebaseFirestore.instance.collection('restaurants').add({
        'name': name,
        'userId': userId,
        'location': location,
        'phoneNumber': phoneNumber,
        'website': website,
        'openTime': openTime,
        'closeTime': closeTime,
        'description': description,
      });

      // Upload image to Firebase Storage and get the URL
      String imageDownloadUrl = await uploadFileToStorage(
          imageUrl, 'images', 'restaurant_${restaurantRef.id}.jpg');

      // Upload document to Firebase Storage and get the URL
      String documentDownloadUrl = await uploadFileToStorage(
          documentUrl, 'documents', 'restaurant_${restaurantRef.id}.pdf');

      // Update the Firestore document with image and document URLs
      await restaurantRef.update({
<<<<<<< HEAD
        "id": restaurantRef.id,
=======
        "id":restaurantRef.id,
>>>>>>> origin/main
        'imageUrl': imageDownloadUrl,
        'documentUrl': documentDownloadUrl,
      });

      print('Restaurant details saved successfully');
    } catch (error) {
      print('Error saving restaurant details: $error');
      // Handle errors as needed
    }
  }

  // Function to upload file to Firebase Storage
  Future<String> uploadFileToStorage(String fileUrl, String folder,
      String fileName) async {
    try {
      Reference storageReference =
      FirebaseStorage.instance.ref().child('$folder/$fileName');
      TaskSnapshot taskSnapshot =

      await storageReference.putFile(File(fileUrl));

          await storageReference.putFile(File(fileUrl));
origin/main
      return await taskSnapshot.ref.getDownloadURL();
    } catch (error) {
      print('Error uploading file to storage: $error');
      // Handle errors as needed
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
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
              const Padding(
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
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'name',
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const Padding(
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
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Location',
                    suffixIcon: Icon(Icons.location_on_outlined),
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const Padding(
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
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(

                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const Padding(
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
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Website',
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const Padding(
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
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownSearch<String>.multiSelection(
                    items: [
                      "Brazil",
                      "Italia (Disabled)",
                      "Tunisia" "Brazil",
                      "Italia (Disabled)",
                      "Tunisia",
                      'Canada'
                    ],
                    popupProps: const PopupPropsMultiSelection.menu(
                      showSelectedItems: true,
                    ),
                    onChanged: print,
                  )),
              const Padding(
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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
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
                        child: TextField(
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
              const Padding(
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
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  maxLines: 7,
                  decoration: InputDecoration(
                    enabled: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const Padding(
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  padding: const EdgeInsets.all(6),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: SizedBox(
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image(
                                image:
                                AssetImage("assets/image/gallery-add.png")),
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
                      height: 200,
                      width: AppConfig.width,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
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
                padding: const EdgeInsets.all(8.0),
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  padding: const EdgeInsets.all(6),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: SizedBox(
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image(
                                image: AssetImage("assets/image/file .png")),
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
        padding: const EdgeInsets.all(8.0),
        child: AppBtn(
          title: "Save",
          style: const TextStyle(
            fontFamily: "Jost",
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.white,
            height: 26 / 18,
          ),
          onPressed: () {
            pushTo(
              context,
              const RestaurantMadlyan(),
            );
          },
        ),
      ),
    );
  }
}
