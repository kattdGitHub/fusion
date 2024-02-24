import 'package:firebase_auth/firebase_auth.dart';
import 'package:fusion/utils/error_box.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signInWithGoogleAndAddToFirestore() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      final OAuthCredential googleAuthCredential =
          GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(googleAuthCredential);

      final User? user = userCredential.user;

      showToast(
        text: 'User signed in with Google: ${user!.displayName}',
        success: true,
      );

      await addUserToFirestore(user);
    } catch (error,tv) {
      showToast(text: 'Error adding user to Firestore');
      print(
          'Error adding user to Firestore: ${tv.toString() + error.toString()}');

    }
  }

  Future<void> addUserToFirestore(User? user) async {
    try {
      if (user != null) {
        final CollectionReference users = _firestore.collection('users');
        await users.doc(user.uid).set({
          'uid': user.uid,
          'displayName': user.displayName,
          'email': user.email,
        });

        showToast(text: 'User added to Firestore', success: true);
      }
    } catch (error, tv) {
      showToast(text: 'Error adding user to Firestore');
      print(
          'Error adding user to Firestore: ${tv.toString() + error.toString()}');
    }
  }
}
