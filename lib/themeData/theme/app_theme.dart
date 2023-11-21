import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
    primary: Color(0xFF202020),
    onPrimary: Color(0xFF505050),
    secondary: Color(0xFFBBBBBB),
    onSecondary: Color(0xFFEAEAEA),
    error: Color(0xFFF32424),
    onError: Color(0xFFF32424),
    background: Color(0xFFF1F2F3),
    onBackground: Color(0xFFFFFFFF),
    surface: Color(0xFF54B435),
    onSurface: Color(0xFF54B435),)
    // brightness: Brightness.light,
    // appBarTheme: AppBarTheme(
    //     backgroundColor: Colors.white,
    //     titleTextStyle: TextStyle(
    //         color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
    //     iconTheme: IconThemeData(color: Colors.black)),
    // floatingActionButtonTheme:
    //     FloatingActionButtonThemeData(backgroundColor: Colors.black,shape: BeveledRectangleBorder(
    //         borderRadius: BorderRadius.circular(15))),
    //         textTheme: TextTheme(
    //           bodyLarge: TextStyle(fontSize: 50)
    //         )

    );
ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.white,
        shape:
            BeveledRectangleBorder(borderRadius: BorderRadius.circular(15))));
