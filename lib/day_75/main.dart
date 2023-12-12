import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_bootcamp_flutter/day_75/views/home_screen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageHome(),
    );
  }
}
