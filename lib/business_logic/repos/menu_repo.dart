import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fusion/business_logic/repos/auth_repo.dart';
import 'package:fusion/utils/error_box.dart';

class MenuRepo {
  static CollectionReference<Map<String, dynamic>> menuCollection =
      FirebaseFirestore.instance.collection('menu');

  static Future<bool> createMenu({
    required String name,
    required String quantity,
    required String price,
    required String description,
    required File imageFile,
    required String restaurantId,
  }) async {
    try {
      String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
      Map<String, dynamic> body = {
        'name': name,
        'userId': userId,
        'quantity': quantity,
        'price': price,
        'restaurantId': restaurantId,
        'description': description,
      };
      String? imagePath = await AuthRepo.uploadImageFirebase(
        imageFile: imageFile,
        docId: imageFile.path.split("/").last,
      );
      body.addAll({
        "image": imagePath,
      });
      final doc = await menuCollection.add(body);
      await menuCollection.doc(doc.id).update({"id": doc.id});
      showToast(text: 'Menu Created Successfully', success: true);
      return true;
    } catch (e, s) {
      print('Error saving Menu details: ${e.toString() + s.toString()}');
      showToast(text: 'Menu Created Failed');
      return false;
    }
  }

  static Future<bool> editMenu({
    String? name,
    String? quantity,
    String? price,
    String? description,
    File? imageFile,
    required String menuId,
  }) async {
    try {
      Map<String, dynamic> body = {
       if (name != null) 'name': name,
       if (price != null) 'price': price,
       if (quantity != null) 'quantity': quantity,
       if (description != null) 'description': description,
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
      await menuCollection.doc(menuId).update(body);
      showToast(text: 'Menu Update Successfully', success: true);
      return true;
    } catch (e, s) {
      print('Error saving Menu Update: ${e.toString() + s.toString()}');
      showToast(text: 'Menu Update Failed');
      return false;
    }
  }

  static Future<bool> deleteMenu(String menuId) async {
    try {
      await menuCollection.doc(menuId).delete();
      showToast(text: 'Menu delete Successfully', success: true);
      return true;
    } catch (error) {
      print('Error saving Menu delete: $error');
      showToast(text: 'Menu delete Failed');
      return false;
    }
  }
}
