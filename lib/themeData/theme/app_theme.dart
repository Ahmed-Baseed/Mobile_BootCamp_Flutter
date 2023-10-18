import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        iconTheme: IconThemeData(color: Colors.black)),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: Colors.black,shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(15))),
            textTheme: TextTheme(
              bodyLarge: TextStyle(fontSize: 50)
            )
            
            );
ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.white,
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(15))));
