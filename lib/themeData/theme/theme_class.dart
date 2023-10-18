import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Application with ChangeNotifier {
  ThemeMode mode = ThemeMode.light;

  toggleTheme(isMode) {
    mode = isMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
