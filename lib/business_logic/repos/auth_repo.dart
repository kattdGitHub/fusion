import 'package:firebase_auth/firebase_auth.dart';
import 'package:fusion/utils/error_box.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRepo {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static GoogleSignIn googleSignIn = GoogleSignIn();
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<void> signInWithGoogleAndAddToFirestore() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;
      if (googleSignInAuthentication == null) return;
      final OAuthCredential googleAuthCredential =
          GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential =
          await auth.signInWithCredential(googleAuthCredential);

      final User? user = userCredential.user;

      showToast(
        text: 'User signed in with Google: ${user!.displayName}',
        success: true,
      );

      await addUserToFirestore(user);
    } catch (error, tv) {
      showToast(text: 'Error adding user to Fir estore');
      print(
          'signInWithGoogleAndAddToFirestore ${tv.toString() + error.toString()}');
    }
  }

  static Future<void> addUserToFirestore(User? user) async {
    try {
      if (user != null) {
        final CollectionReference users = firestore.collection('users');
        await users.doc(user.uid).set({
          'uid': user.uid,
          'displayName': user.displayName,
          'email': user.email,
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
        final QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
            .collection('Users').where('email', isEqualTo: email)
            .get();
        return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print('doesUserExistWithEmail $e');
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
      if (userExists){
        showToast(text: 'Email is already Exits');
        return;
      }
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
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
        print(">>>>>>>>>>>>> User Create <<<<<<<<<<<<<<");
      });
    } catch (e, s) {
      print("createUser ${e.toString() + s.toString()}");
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
      print("uploadImageFirebase  ${e.toString() + s.toString()}");
      return null;
    }
  }

  static Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      showToast(text: 'Logout Successfully', success: true);
    } catch (e, s) {
      showToast(text: 'Logout Failed');
      print('signOut ${s.toString() + e.toString()}');
    }
  }

  static Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
     await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      showToast(text: 'Login Successfully', success: true);
    } catch (e, s) {
      showToast(text: 'Login Failed');
      print('Login ${s.toString() + e.toString()}');
    }
  }
}
