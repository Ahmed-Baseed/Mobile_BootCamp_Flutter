import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/shared_preferences/home_screen.dart';
import 'package:mobile_bootcamp_flutter/shared_preferences/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    checkAuth(context);
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  checkAuth(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));
    SharedPreferences shared = await SharedPreferences.getInstance();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      if(shared.getString("token")==null)
      return LoginScreen();
      return HomePage();
    },));
  }
}
