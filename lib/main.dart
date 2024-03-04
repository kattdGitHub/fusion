import 'package:fusion/Theme/theme.dart';
import 'package:fusion/app_config/app_config.dart';
import 'package:fusion/business_logic/providers/auth_provider.dart';
import 'package:fusion/business_logic/providers/menu_provider.dart';
import 'package:fusion/business_logic/providers/provider.dart';
import 'package:fusion/business_logic/providers/restaurants_provider.dart';
import 'package:fusion/screens/auth_screens/splash.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Iconspus/ProfileIcons/profile_page.dart';
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
    return ScreenUtilInit(
      designSize: const Size(
        360,
        690,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => UserProvider()),
            ChangeNotifierProvider(create: (context) => CounterProvider()),
            ChangeNotifierProvider(create: (context) => AddUserProvider()),
            ChangeNotifierProvider(create: (context) => RestaurantsProvider()),
            ChangeNotifierProvider(create: (context) => MenuProvider()),
          ],
          child: MaterialApp(
            title: "Fusion",
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            theme: MyTheme.lightTheme(context),
            darkTheme: MyTheme.darkTheme(context),
            home: const ProfilePage(),
          ),
        );
      },
    );
  }
}
