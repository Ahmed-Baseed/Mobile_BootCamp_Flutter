import 'package:flutter/material.dart';
// import 'package:mobile_bootcamp_flutter/api_lecture/dio.dart';
// import 'package:mobile_bootcamp_flutter/day_44/viewData.dart';
// import 'package:mobile_bootcamp_flutter/day_45/view/todoView.dart';
import 'package:mobile_bootcamp_flutter/day_48/view/deptScreen.dart';
// import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/routeManage/routeManage.dart';
// import 'package:mobile_bootcamp_flutter/day_42/views/post_view.dart';
// import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/view/homePage.dart';
// import 'package:mobile_bootcamp_flutter/clipPath/clipPath_example.dart';
// import 'package:mobile_bootcamp_flutter/day_36/view/courseList.dart';
// import 'package:mobile_bootcamp_flutter/day_37/view/add_semester.dart';
// import 'package:mobile_bootcamp_flutter/day_37/view/test.dart';
// import 'package:mobile_bootcamp_flutter/flutterFavorite/slidablePackage.dart';
// import 'package:mobile_bootcamp_flutter/flutterFavorite/sliverAppBar.dart';
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
      home: Dept_screen(),
      // initialRoute: '/',
      // onGenerateRoute: RouteManager.generateRoute,
    );
  }
}
