import 'package:firebase/LoginScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FireBase',
      theme: ThemeData(
        
        primaryColor: Colors.white,
        fontFamily: "Jost",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,
        ),

      ),


     home:LoginScreen() ,
    );
  }
}




