import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mobile_bootcamp_flutter/themeData/secondPage.dart';
import 'package:mobile_bootcamp_flutter/themeData/theme/app_theme.dart';
import 'package:mobile_bootcamp_flutter/themeData/theme/theme_class.dart';

void main() {
  runApp(MyApp());
}

Application appTheme = Application();

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    appTheme.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Themedata(),
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: appTheme.mode,
    );
  }
}

class Themedata extends StatefulWidget {
  const Themedata({super.key});

  @override
  State<Themedata> createState() => _ThemedataState();
}

class _ThemedataState extends State<Themedata> {
  bool isMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          Switch(
              activeColor: Colors.white,
              splashRadius: 10,
              value: isMode,
              onChanged: (value) {
                isMode = value;
                appTheme.toggleTheme(isMode);

                setState(() {});
              }),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isMode?
            Text("Dark Mode"):
            Text("Light Mode",style: Theme.of(context).textTheme.bodyLarge,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage(),));
        },
        child: isMode
            ? Icon(
                HeroIcons.moon,
                size: 30,
              )
            : Icon(
                HeroIcons.sun,
                size: 30,
              ),
      ),
    );
  }
}
