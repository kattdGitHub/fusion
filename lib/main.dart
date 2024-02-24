import 'package:flutter/material.dart';
import 'package:fusion/Savebth/savebtn.dart';
import 'package:fusion/Theme/theme.dart';
import 'package:fusion/app_config/app_config.dart';
import 'package:fusion/dashboard/Dashboard.dart';
import 'package:fusion/screens/auth_screens/login_screen.dart';
import 'package:fusion/screens/auth_screens/splash.dart';
import 'package:fusion/screens/home/restaurant_home_page.dart';
import 'package:fusion/screens/home/slider_card.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppConfig.init(context);
    return MaterialApp(
      title: "Rserva",
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      home: const MyHomePage(),
    );
  }
}
