import 'package:flutter/material.dart';

import 'day_26/exercise1.dart';
import 'day_26/exercise2.dart';
import 'day_26/exercise3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoApp(),
    );
  }
}
