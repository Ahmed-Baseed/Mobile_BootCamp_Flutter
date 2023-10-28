// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/features/view/customPlanPage.dart';

class SubscriptionComponents extends StatelessWidget {
  Container? container;
  SubscriptionComponents({
    Key? key,
    this.container,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 37, 41, 1),
      appBar: AppBar(
        title: Text("SUBSCRIPTION PLAN"),
        backgroundColor: Color.fromRGBO(33, 37, 41, 1),
        iconTheme: IconThemeData(color: Colors.amber),
        elevation: 10,
      ),
      body: Container(
          padding: EdgeInsets.only(top: 30, right: 15, left: 15, bottom: 40),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    "CHOOSE THE PLAN THAT'S RIGHT FOR YOU",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 60,
                ),
                Text(
                  "Custom your plan",
                  style: TextStyle(color: Colors.amber, fontSize: 12),
                ),
              ],
            ),
            smallSpace(),
            Text("Downgrade or upgrade at any time",
                style: TextStyle(color: Colors.white, fontSize: 12)),
            largeSpace(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 70,
                  width: 115,
                  color: Colors.grey[800],
                  child: Center(
                      child: Text("BASIC",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                ),
                Container(
                  height: 70,
                  width: 115,
                  color: Colors.amber,
                  child: Center(
                      child: Text("STANDARD",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                ),
                Container(
                  height: 70,
                  width: 115,
                  color: Colors.grey[800],
                  child: Center(
                      child: Text("PREMIUM",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                ),
              ],
            ),
            mediamSpace(),
            container!,
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.grey[700])),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CustomPlan(),
                            ));
                      },
                      child: Text(
                        "CONTINUE",
                        style: TextStyle(
                            color: Colors.amber, fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
          ])),
    );
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
}
