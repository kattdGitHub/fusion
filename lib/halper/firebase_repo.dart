import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> uploadImageFirebase(
    String userId, File imageFile) async {
  // Create a reference to the Firebase Storage location
  Reference storageRef = FirebaseStorage.instance.ref()
      .child('images').child(userId)
      // .child("${imageFile.path.split("/").last}.png")
      .child('${DateTime.now().toIso8601String()}.png')
  ;

  // Upload the image to Firebase Storage
  UploadTask uploadTask = storageRef.putFile(imageFile);

  // Wait for the upload to complete and get the download URL
  TaskSnapshot storageSnapshot = await uploadTask;
  String downloadUrl = await storageSnapshot.ref.getDownloadURL();
/// // Add a document with the image link to the user collection in Firestore
//   await FirebaseFirestore.instance.collection('users').doc(userId).collection('images').add({
//     'imageUrl': downloadUrl,
//     'createdAt': Timestamp.now(), // Optionally, you can add a timestamp for when the image was uploaded
//   });

  // Return the download URL of the uploaded image
  return downloadUrl;
}
