import 'package:flutter/material.dart';



import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Colors.green;
  static const Color creamColor = Color(0xfff5f5f5);
  static const Color darkCreamColor = Color(0xff121212);
  static const Color darkBluishColor = Color(0xff403b58);
  static const Color lightBluishColor = Color(0xff64b5f6);
}

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primaryColor: AppColors.primaryColor,
        cardColor: Colors.white,
        canvasColor: creamColor,
        backgroundColor: creamColor,
        hintColor: darkBluishColor,
        dividerColor: darkBluishColor,
        disabledColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        textTheme: Theme.of(context).textTheme.copyWith(
              displayLarge: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(color: Colors.black),
              displayMedium: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(color: Colors.black),
              displaySmall: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(color: Colors.black),
              headlineMedium: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: Colors.black),
              headlineSmall: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Colors.black),
              titleLarge: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.black),
              titleMedium: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.black),
              titleSmall: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: Colors.black),
              bodyLarge: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.black),
              bodyMedium: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.black),
              bodySmall: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.black),
              labelLarge: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: Colors.black),
              labelSmall: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: Colors.black),
            ), bottomAppBarTheme: BottomAppBarTheme(color: darkBluishColor),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        cardColor: Colors.black,
        canvasColor: darkCreamColor,
        hintColor: Colors.white,
        dividerColor: Colors.white,
        disabledColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: creamColor,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        textTheme: Theme.of(context).textTheme.copyWith(
              displayLarge: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(color: Colors.white),
              displayMedium: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(color: Colors.white),
              displaySmall: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(color: Colors.white),
              headlineMedium: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: Colors.white),
              headlineSmall: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Colors.white),
              titleLarge: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white),
              titleMedium: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.white),
              titleSmall: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: Colors.white),
              bodyLarge: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.white),
              bodyMedium: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.white),
              bodySmall: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.white),
              labelLarge: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: Colors.white),
              labelSmall: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: Colors.white),
            ), bottomAppBarTheme: BottomAppBarTheme(color: lightBluishColor),
      );

  //color
  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkCreamColor = Colors.grey;
  static Color darkBluishColor = const Color(0xff403b58);
  static Color lightBluishColor = Colors.indigo;
}
