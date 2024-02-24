import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fusion/Savebth/savebtn.dart';
import 'package:fusion/Theme/theme.dart';
import 'package:fusion/app_config/app_config.dart';
import 'package:fusion/business_logic/providers/auth_provider.dart';
import 'package:fusion/dashboard/Dashboard.dart';
import 'package:fusion/screens/auth_screens/login_screen.dart';
import 'package:fusion/screens/auth_screens/splash.dart';
import 'package:fusion/screens/home/restaurant_home_page.dart';
import 'package:fusion/screens/home/slider_card.dart';
import 'package:provider/provider.dart';

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
    AppConfig.init(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: MaterialApp(
        title: "Fusion",
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: MyTheme.lightTheme(context),
        darkTheme: MyTheme.darkTheme(context),
        home: const SplashScreen(),
      ),
    );
  }
}
