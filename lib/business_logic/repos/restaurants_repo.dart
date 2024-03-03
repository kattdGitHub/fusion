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
      Map<String, dynamic> body = {
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

      // Get the current timestamp
      Timestamp createdAt = Timestamp.now();
      body.addAll({
        "createdAt": createdAt,
        "image": imagePath,
        "docPath": docPath,
      });

      final doc = await restaurantsCollection.add(body);
      await restaurantsCollection.doc(doc.id).update({"id": doc.id});
      showToast(text: 'Restaurant Created Successfully', success: true);
      return true;
    } catch (error) {
      print('Error saving restaurant details: $error');
      showToast(text: 'Restaurant Created Failed');
      return false;
    }
  }

  static Future<bool> restarurantMenu(String restarurantId) async {
    try {
      await restaurantsCollection.doc(restarurantId).delete();
      showToast(text: 'restarurant delete Successfully', success: true);
      return true;
    } catch (error) {
      print('Error saving restarurant delete: $error');
      showToast(text: 'restarurant delete Failed');
      return false;
    }
  }

  static Future<bool> editRestarurant({
    String? name,
    String? description,
    String? location,
    String? phoneNumber,
    String? openTime,
    String? closeTime,
    File? imageFile,
    required String restaurantId,
  }) async {
    try {
      Map<String, dynamic> body = {
        if (name != null) 'name': name,
        if (description != null) 'description': description,
        if (location != null) 'location': location,
        if (phoneNumber != null) 'phoneNumber': phoneNumber,
        if (openTime != null) 'openTime': openTime,
        if (closeTime != null) 'closeTime': closeTime,
      };
      if (imageFile != null) {
        String? imagePath = await AuthRepo.uploadImageFirebase(
          imageFile: imageFile,
          docId: imageFile.path.split("/").last,
        );
        body.addAll({
          "image": imagePath,
        });
      }
      await restaurantsCollection.doc(restaurantId).update(body);
      showToast(text: 'Restaurant Update Successfully', success: true);
      return true;
    } catch (e, s) {
      print('Error saving restaurant Update: $e $s');
      showToast(text: 'Restaurant Update Failed');
      return false;
    }
  }
}
