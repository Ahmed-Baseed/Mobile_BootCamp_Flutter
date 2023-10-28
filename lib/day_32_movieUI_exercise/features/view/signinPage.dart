import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/features/view/createAccount.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/features/view/homePage.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("CREATE AN ACCOUNT"),
        iconTheme: IconThemeData(color: Colors.amber),
      ),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/pxfuel.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.7),
                    BlendMode.srcOver,
                  ))),
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Color.fromRGBO(33, 37, 41, 1).withOpacity(0.5),
                  Color.fromRGBO(33, 37, 41, 1).withOpacity(1),
                ],
              ),
            ),
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.white)),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    mediamSpace(),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.white),
                          suffix: Icon(
                            Bootstrap.eye_fill,
                            color: Colors.white,
                            size: 20,
                          )),
                      obscureText: false,
                    ),
                    largeSpace(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.amber)),
                          onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));},
                          child: Text(
                            "Sign In",
                            style: TextStyle(color: Colors.black),
                          )),
                    ),
                    mediamSpace(),
                    largeSpace(),
                    Text(
                      "Sign In With Social Media",
                      style: TextStyle(color: Colors.white),
                    ),
                    mediamSpace(),
                    SizedBox(
                      width: 130,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                            height: 40,
                            width: 40,
                            child: Logo(
                              Logos.google,
                              size: 30,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                            height: 40,
                            width: 40,
                            child: Logo(
                              Logos.facebook_f,
                              size: 30,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                            height: 40,
                            width: 40,
                            child: Logo(
                              Logos.twitter,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    mediamSpace(),
                    largeSpace(),
                    SizedBox(
                      width: 185,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Not a member Yet?",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CreateAccount(),
                                  ));
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(color: Colors.amber),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

smallSpace() {
  return SizedBox(
    height: 10,
  );
}

mediamSpace() {
  return SizedBox(
    height: 20,
  );
}

largeSpace() {
  return SizedBox(
    height: 40,
  );
}
