import 'package:flutter/material.dart';

class Themes {
  final List<ThemeData> themes = [
    ThemeData(
        colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: Colors.teal,
            onPrimary: Colors.white,
            secondary: Colors.teal,
            onSecondary: Color(0xFFEAEAEA),
            error: Color(0xFFF32424),
            onError: Color(0xFFF32424),
            background: Color(0xFFF1F2F3),
            onBackground: Color(0xFFFFFFFF),
            surface: Color(0xFF54B435),
            onSurface: Color(0xFF54B435)))
  ];
}
