import 'package:firebase/Screen_All/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,

  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    final login=FirebaseAuth.instance.currentUser!=null;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FireBase',
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        fontFamily: "Jost",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,
        ),
      ),
     home:LoginScreen() ,
    );
  }
}




