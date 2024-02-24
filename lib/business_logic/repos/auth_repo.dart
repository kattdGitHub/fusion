import 'package:firebase_auth/firebase_auth.dart';
import 'package:fusion/utils/error_box.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
   if(googleSignInAuthentication==null)return;
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
    } catch (error,tv) {
      showToast(text: 'Error adding user to Firestore');
      print(
          'Error adding user to Firestore: ${tv.toString() + error.toString()}');

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
      print(
          'Error adding user to Firestore: ${tv.toString() + error.toString()}');
    }
  }
}
