import 'package:firebase_app/day_80/task_app/view/mainPage.dart';
import 'package:firebase_app/day_80/task_app/viewModel/taskVm.dart';
import 'package:firebase_app/firebase_firestore/firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskVM(),
      child: Consumer<TaskVM>(
        builder: (context, tvm, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: TaskHomeScreen(),
          );
        },
      ),
    );
  }
}
