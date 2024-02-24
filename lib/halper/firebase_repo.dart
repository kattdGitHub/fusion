import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseRepo {

 static Future<bool> doesUserExistWithEmail(String email) async {
    try {
      List<String> signInMethods = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      return signInMethods.isNotEmpty;
    } catch (e) {
      print('Error checking user existence with email: $e');
      return false;
    }
  }

  static Future<void> createUser({
    required String email,
    required String password,
    required File imageFile,
  }) async {
    try {
      Map<String, dynamic> body = {
        "email": email,
        "password": password,
      };

      bool userExists = await doesUserExistWithEmail(email);
      if (!userExists) {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      }
      final collection = FirebaseFirestore.instance.collection("Users");
      await collection.add(body).then((doc) async {
        String? imagePath = await uploadImageFirebase(
          userId: doc.id,
          imageFile: imageFile,
        );
        collection.doc(doc.id).update({
          "id": doc.id,
          "image": imagePath,
        });
        print(">>>>>>>>>>>>>User Create<<<<<<<<<<<<<<");
      });
    } catch (e, s) {
      print(e.toString() + s.toString());
    }
  }

  static Future<String?> uploadImageFirebase({
    required String userId,
    required File imageFile,
  }) async {
    try {
      if (imageFile.path.isEmpty) return null;
      Reference storageRef = FirebaseStorage.instance
          .ref()
          .child('images')
          .child(userId)
          .child('${DateTime.now().toIso8601String()}.png');
      UploadTask uploadTask = storageRef.putFile(imageFile);
      TaskSnapshot storageSnapshot = await uploadTask;
      String downloadUrl = await storageSnapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e, s) {
      print(e.toString() + s.toString());
      return null;
    }
  }
}
