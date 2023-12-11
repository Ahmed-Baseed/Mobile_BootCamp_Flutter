import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _currentTheme = ThemeData.dark();
  GetStorage box = GetStorage();

  themeProvider() {
    _currentTheme = box.read('theme') ?? ThemeData.light();
  }

  ThemeData get currentTheme => _currentTheme;

  void toggleTheme() {
    _currentTheme = _currentTheme == ThemeData.light()
        ? ThemeData.dark()
        : ThemeData.light();
        box.write('theme',_currentTheme);
    notifyListeners();
  }
}
