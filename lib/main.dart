import 'package:firebase/Screen_All/LoginScreen.dart';
import 'package:firebase/Screen_All/Otpverfiy.dart';
import 'package:firebase/Screen_All/PhoneScreen.dart';
import 'package:firebase/Screen_All/showdata.dart';
import 'package:firebase/halper/chackuser.dart';
import 'package:firebase/halper/provider.dart';
import 'package:firebase/signup%20page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.camera.request();
  await Permission.photos.request();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => AddUserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'fusion',
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
          fontFamily: "Jost",
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
        ),
        home: Showdata(),
      ),
    );
  }
}
