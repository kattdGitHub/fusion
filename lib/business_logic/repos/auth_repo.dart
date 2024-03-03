import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fusion/utils/error_box.dart';

class AuthRepo {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static GoogleSignIn googleSignIn = GoogleSignIn();
  static CollectionReference users =
      FirebaseFirestore.instance.collection('Users');

  static Future<bool> resetPassword(String email) async {
    try {
      bool userExists = await doesUserExistWithEmail(email);
      if (!userExists) {
        showToast(text: 'Email does not exist');
        return false;
      }
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email.trim(),
      );
      showToast(
        text: 'Password reset email sent. Check your inbox.',
        success: true,
      );
      return true;
    } catch (e, s) {
      print("resetPassword ${e.toString() + s.toString()}");
      showToast(text: 'Failed to send password reset email.');
      return false;
    }
  }

  static Future<bool> signInWithGoogleAndAddToFirestore() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;
      if (googleSignInAuthentication == null) return false;
      final OAuthCredential googleAuthCredential =
          GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential =
          await auth.signInWithCredential(googleAuthCredential);

      final User? user = userCredential.user;

      await addUserToFirestore(user);
      return true;
    } catch (error, tv) {
      showToast(text: 'Error adding user to Firestore');
      print(
          'signInWithGoogleAndAddToFirestore ${tv.toString() + error.toString()}');
      return false;
    }
  }

  static Future<void> addUserToFirestore(User? user) async {
    try {
      if (user != null) {
        // Get the current timestamp
        Timestamp createdAt = Timestamp.now();
        await users.doc(user.uid).set({
          'uid': user.uid,
          "phoneNumber": user.phoneNumber,
          'firstName': user.displayName,
          'email': user.email,
          "createdAt": createdAt,
          if (user.photoURL != null || user.providerData.isNotEmpty == true)
            "image": user.photoURL ?? user.providerData.first.photoURL,
        });

        showToast(text: 'User added to Firestore', success: true);
      }
    } catch (error, tv) {
      showToast(text: 'Error adding user to Firestore');
      print('addUserToFirestore ${tv.toString() + error.toString()}');
    }
  }

  static Future<bool> doesUserExistWithEmail(String email) async {
    try {
      final querySnapshot = await users.where('email', isEqualTo: email).get();
      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print('doesUserExistWithEmail $e');
      return false;
    }
  }

  static Future<bool> createUser({
    required String email,
    String? firstName,
    String? lastName,
    String? dialCode,
    String? phoneNumber,
    String? countryCode,
    required String password,
    required File imageFile,
  }) async {
    try {
      Map<String, dynamic> body = {
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "countryCode": countryCode,
        "phoneNumber": phoneNumber,
      };

      bool userExists = await doesUserExistWithEmail(email);
      if (userExists) {
        showToast(text: 'Email is already exists');
        return false;
      }

      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;

      String? imagePath = await uploadImageFirebase(
        docId: user!.uid,
        imageFile: imageFile,
      );
      // Get the current timestamp
      Timestamp createdAt = Timestamp.now();
      body.addAll({
        "createdAt": createdAt,
        "image": imagePath,
        "uid": user.uid,

      });

      await users.doc(user.uid).set(body);

      showToast(text: 'Account Created Successfully', success: true);
      print(">>>>>>>>>>>>> User Created <<<<<<<<<<<<<<");

      return true;
    } catch (e, s) {
      print("createUser ${e.toString() + s.toString()}");
      return false;
    }
  }

  static Future<String?> uploadImageFirebase({
    required String docId,
    required File imageFile,
  }) async {
    try {
      if (imageFile.path.isEmpty) return null;
      Reference storageRef = FirebaseStorage.instance
          .ref()
          .child('images')
          .child(docId)
          .child('${DateTime.now().toIso8601String()}.png');
      UploadTask uploadTask = storageRef.putFile(imageFile);
      TaskSnapshot storageSnapshot = await uploadTask;
      String downloadUrl = await storageSnapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e, s) {
      print("uploadImageFirebase  ${e.toString() + s.toString()}");
      return null;
    }
  }

  static Future<bool> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      showToast(text: 'Logout Successfully', success: true);
      return true;
    } catch (e, s) {
      showToast(text: 'Logout Failed');
      print('signOut ${s.toString() + e.toString()}');
      return false;
    }
  }

  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      showToast(text: 'Login Successfully', success: true);
      return true;
    } catch (e, s) {
      showToast(text: 'Login Failed');
      print('Login ${s.toString() + e.toString()}');
      return false;
    }
  }

  // Method to update user profile
  static Future<bool> updateProfile({
    required String? firstName,
    required String? lastName,
    required String? countryCode,
    required String? dialCode,
    required String? phoneNumber,
    required File? imageFile,
  }) async {
    try {
      String? userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) return false;
      Map<String, dynamic> updatedData = {};
      if (firstName != null) updatedData['firstName'] = firstName;
      if (countryCode != null) updatedData['countryCode'] = countryCode;
      if (dialCode != null) updatedData['dialCode'] = dialCode;
      if (lastName != null) updatedData['lastName'] = lastName;
      if (phoneNumber != null) updatedData['phoneNumber'] = phoneNumber;

      if (imageFile != null) {
        String? imagePath =
            await uploadImageFirebase(docId: userId, imageFile: imageFile);
        if (imagePath != null) {
          updatedData['image'] = imagePath;
        }
      }

      await users.doc(userId).update(updatedData);
      showToast(text: 'Profile updated successfully', success: true);
      return true;
    } catch (e, s) {
      print('updateProfile ${e.toString() + s.toString()}');
      showToast(text: 'Failed to update profile');
      return false;
    }
  }

  // Method to delete user account
  static Future<bool> deleteAccount() async {
    try {
      String? userId = FirebaseAuth.instance.currentUser?.uid;
      await auth.currentUser?.delete();
      await users.doc(userId).delete();
      showToast(text: 'Account deleted successfully', success: true);
      return true;
    } catch (e, s) {
      print('deleteAccount ${e.toString() + s.toString()}');
      showToast(text: 'Failed to delete account');
      return false;
    }
  }

  static Future<Object?> getProfile() async {
    try {
      String? uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) return null;
      final querySnapshot = await users.doc(uid).get();
      return querySnapshot.data();
    } catch (e, s) {
      print('getProfileByFirebaseAuthUid ${e.toString() + s.toString()}');
    }
    return null;
  }
}
