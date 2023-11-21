import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mobile_bootcamp_flutter/day_59/model/tasks.dart';
import 'package:mobile_bootcamp_flutter/hive_lecture/core/model/product22.dart';
import 'package:mobile_bootcamp_flutter/hive_lecture/core/view/spalsh_screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.openBox("tasks");
  Hive.registerAdapter(TasksAdapter());
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
      home: Spalsh_sreen(),
    );
  }
}
