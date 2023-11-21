import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel {
  late List<Map<String, dynamic>> users = [];
  UserViewModel() {
    users.add({"email": "ahmed@gmail.com", "name": "ahmed", "passowrd": "123"});
    users.add({"email": "salem@gmail.com", "name": "salem", "passowrd": "123"});
    users.add(
        {"email": "khaled@gmail.com", "name": "khaled", "passowrd": "123"});
  }
  login(String email, String passowrd) async {
    bool isLogged = false;
    users.forEach((element) async {
      if (element['email'] == email && element['password'] == passowrd) {
        await authUser();
        isLogged = true;
      }
    });
    return isLogged;
  }

  authUser() async {
    Random rand = Random();
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setInt('token', rand.nextInt(20));
  }
}
