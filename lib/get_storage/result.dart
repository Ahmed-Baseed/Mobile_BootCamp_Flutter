import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/get_storage/settings.dart';

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Settings(),));
          }, icon: Icon(Icons.settings))
        ],
      ),
    );
  }
}