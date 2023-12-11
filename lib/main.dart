import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/day_73/providerExercise/main_screen.dart';
import 'package:mobile_bootcamp_flutter/dy57_amal/db_helper.dart';
import 'package:mobile_bootcamp_flutter/get_storage/result.dart';
import 'package:mobile_bootcamp_flutter/themeProvider/pageHome.dart';
// import 'package:mobile_bootcamp_flutter/providerLecture/homeScreen.dart';
// import 'package:mobile_bootcamp_flutter/dy57_amal/views/app_home_page.dart';
// import 'package:mobile_bootcamp_flutter/hive_lecture/core/view/spalsh_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDatabase();
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
    // Themes theme = Themes();
    return MaterialApp(
      // theme: theme.themes[0],
      debugShowCheckedModeBanner: false,
      // home: Scaffold(
      //   appBar: AppBar(),
      // ),
      // home: AppHomePage(),
      home: HomeScreen(),
      // initialRoute: '/',
      // onGenerateRoute: RouteManager.generateRoute,
    );
  }
}
