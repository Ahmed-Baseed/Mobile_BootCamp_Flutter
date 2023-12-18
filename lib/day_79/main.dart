import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/day_79/task_app/view/mainPage.dart';
import 'package:mobile_bootcamp_flutter/day_79/task_app/viewModel/taskVm.dart';
import 'package:provider/provider.dart';

void main() {
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
