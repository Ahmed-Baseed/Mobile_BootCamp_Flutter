import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/animationController/animationController.dart';
import 'package:mobile_bootcamp_flutter/animationController/flipAnimation.dart';
// import 'package:mobile_bootcamp_flutter/day_32/productList.dart';
// import 'package:mobile_bootcamp_flutter/animationFlutter/homeScreen.dart';
// import 'package:mobile_bootcamp_flutter/day_31/exercise1/randomAnimation.dart';
// import 'package:mobile_bootcamp_flutter/flutterPackages/packages.dart';
// import 'package:mobile_bootcamp_flutter/flutterPackages/splashScreen.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/homePage.dart';
import 'package:mobile_bootcamp_flutter/day_34/day34_exercise.dart';
// import 'package:mobile_bootcamp_flutter/day_29/exercise1/searchTask.dart';
// import 'package:mobile_bootcamp_flutter/day_30/exercise1/textFeildForm.dart';
// import 'package:mobile_bootcamp_flutter/day_30/exercise2/dropDown.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Day34_Exercise(),
    );
  }
}
