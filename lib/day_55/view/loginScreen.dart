import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/features/view/signinPage.dart';
import 'package:mobile_bootcamp_flutter/day_55/view/showInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  SharedPreferences? sharedPreferences;
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('shared preferences')),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
            child: Column(
          children: [
            TextFormField(
              controller: nameTextEditingController,
              decoration: InputDecoration(hintText: 'Username'),
            ),
            TextFormField(
              controller: emailTextEditingController,
              decoration: InputDecoration(hintText: 'Email'),
            ),
            smallSpace(),
            ElevatedButton(
                onPressed: () async {
                  setState(() {});
                  String name = nameTextEditingController.text;
                  String email = emailTextEditingController.text;
                  sharedPreferences = await SharedPreferences.getInstance();
                  sharedPreferences!.setString('n', name);
                  sharedPreferences!.setString('e', email);
                  if (email.isNotEmpty)
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShowInfo(),
                        ));
                },
                child: Text("Start journey"))
          ],
        )),
      ),
    );
  }
}
