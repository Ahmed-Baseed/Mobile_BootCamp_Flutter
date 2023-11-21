import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/dy57_amal/db_helper.dart';
import 'package:mobile_bootcamp_flutter/dy57_amal/views/addStudent.dart';
import 'package:mobile_bootcamp_flutter/dy57_amal/views/showStudent.dart';

class AppHomePage extends StatefulWidget {
  const AppHomePage({super.key});

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3c6e71),
      body: Stack(
        children: [
          Positioned(
            top: 150,
            left: 85,
            child: Hero(
                tag: 1,
                child: Image.asset("assets/images/FGF.png", height: 50)),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 80),
              height: MediaQuery.of(context).size.height * 0.65,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  color: Color(0xffd9d9d9)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Add_student(),
                                ));
                          },
                          child: Container(
                            padding: EdgeInsets.all(25),
                            decoration: BoxDecoration(
                                color: Color(0xff3c6e71),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Add Students",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ShowStudent(),
                                ));
                          },
                          child: Container(
                            padding: EdgeInsets.all(25),
                            decoration: BoxDecoration(
                                color: Color(0xff3c6e71),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.list,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Show Students",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
