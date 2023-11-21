import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_bootcamp_flutter/get_storage/result.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // TextEditingController textEditingController = TextEditingController();
  GetStorage box = GetStorage();
  @override
  // void initState() {
  //   textEditingController.text = box.read("name_txt") ?? "No value available";
  //   super.initState();
  // }
  void initState() {
    box.listen(() {
      setState(() {
        
      });
     });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: box.read('Dark')? ThemeData.dark():ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Result(),
      // home: Scaffold(
      //   body: Container(
      //     padding: EdgeInsets.all(20),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         TextFormField(controller: textEditingController),
      //         ElevatedButton(onPressed: (){
      //           box.write("name_txt", textEditingController.text);
      //         }, child: Text("Save"))
      //       ],
      //     ),
      //   ),

      // ),
    );
  }
}
