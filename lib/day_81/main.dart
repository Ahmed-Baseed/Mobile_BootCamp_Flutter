import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/day_81/post_exercise/features/view/postHomePage.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PostHomePage(),
    );
  }
}