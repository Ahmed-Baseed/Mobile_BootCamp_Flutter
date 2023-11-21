import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/shared_preferences/home_screen.dart';
import 'package:mobile_bootcamp_flutter/shared_preferences/user_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserViewModel uVM =UserViewModel();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Container(
          child: Form(child: Column(
            children: [
              TextFormField(controller: emailTextEditingController,),
              TextFormField(controller: passwordTextEditingController,),
              ElevatedButton(onPressed: ()async{
                bool isLogged = await uVM.login(emailTextEditingController.text, passwordTextEditingController.text);
                if(isLogged){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return HomePage();
                  },));
                }
              }, child: Text("save"))
            ],
          )),
        ),
      ),
    );
  }
}
