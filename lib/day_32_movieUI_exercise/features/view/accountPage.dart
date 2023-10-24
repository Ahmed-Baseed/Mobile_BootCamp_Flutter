import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 37, 41, 1),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              HeroIcons.tv,
              color: Colors.amber[700],
              size: 100,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "START BY CREATING AN ACCOUNT.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Connect to using your favorite devices using your favorite devices",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.amber[700])),
                  onPressed: () {},
                  child: Text(
                    "CREATE AN ACCOUNT",
                    style: TextStyle(color: Colors.black),
                  )),
            ),
            SizedBox(height: 10,),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white)),
                  onPressed: () {},
                  child: Text(
                    "SIGN IN",
                    style: TextStyle(color: Colors.black),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
