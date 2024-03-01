import 'dart:io';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fusion/business_logic/repos/auth_repo.dart';
import 'package:fusion/utils/error_box.dart';

class RestaurantsRepo {
  static CollectionReference<Map<String, dynamic>> restaurantsCollection =
      FirebaseFirestore.instance.collection('restaurants');

  static Future<bool> createRestaurant({
    required String name,
    required String location,
    required String phoneNumber,
    required String openTime,
    required String closeTime,
    required String description,
    required File imageFile,
    required File docFile,
  }) async {
    try {
      String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
      Map<String, dynamic> body={
        'name': name,
        'userId': userId,
        'location': location,
        'phoneNumber': phoneNumber,

        'openTime': openTime,
        'closeTime': closeTime,
        'description': description,
      };

      String? imagePath = await AuthRepo.uploadImageFirebase(
        imageFile: imageFile,
        docId: imageFile.path.split("/").last,
      );

      String? docPath = await AuthRepo.uploadImageFirebase(
        imageFile: docFile,
        docId: docFile.path.split("/").last,
      );

      body.addAll({
        "image": imagePath,
        "docPath": docPath,
      });

     final doc= await restaurantsCollection.add(body);
     await restaurantsCollection.doc(doc.id).update({
       "id":doc.id
     });
      showToast(text: 'Restaurant Created Successfully', success: true);
      return true;
    } catch (error) {
      print('Error saving restaurant details: $error');
      showToast(text: 'Restaurant Created Failed');
      return false;
    }
  }


}
