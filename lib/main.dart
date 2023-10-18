import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/day_36/view/courseList.dart';
// import 'package:mobile_bootcamp_flutter/pizzaTask/view/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CourseList(),
    );
  }
}
