import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_bootcamp_flutter/core/local_database/db_helper.dart';
import 'package:mobile_bootcamp_flutter/features/views/homePage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
        theme: ThemeData(
          textTheme:
          GoogleFonts.elMessiriTextTheme(Theme.of(context).textTheme),
        ),
    );
  }
}
