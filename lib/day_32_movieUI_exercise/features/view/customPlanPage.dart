import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/features/view/paymentMethod.dart';

class CustomPlan extends StatefulWidget {
  const CustomPlan({super.key});

  @override
  State<CustomPlan> createState() => _CustomPlanState();
}

class _CustomPlanState extends State<CustomPlan> {
  int? selectedValue, selectedValue2;
  String? selectedValue3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 37, 41, 1),
      appBar: AppBar(
        title: Text("CUSTOM PLAN"),
        backgroundColor: Color.fromRGBO(33, 37, 41, 1),
        iconTheme: IconThemeData(color: Colors.amberAccent),
        elevation: 10,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 30, right: 15, bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "DURATION",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Transform.scale(
                  scale: 0.7,
                  child: Radio(
                      visualDensity: VisualDensity.compact,
                      fillColor: MaterialStateProperty.all(Colors.amberAccent),
                      activeColor: Colors.amberAccent,
                      value: 1,
                      groupValue: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      }),
                ),
                Text("07 days",
                    style: TextStyle(color: Colors.white, fontSize: 12)),
                Transform.scale(
                  scale: 0.7,
                  child: Radio(
                      visualDensity: VisualDensity.compact,
                      fillColor: MaterialStateProperty.all(Colors.amberAccent),
                      activeColor: Colors.amberAccent,
                      value: 2,
                      groupValue: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      }),
                ),
                Text("07 days",
                    style: TextStyle(color: Colors.white, fontSize: 12)),
                Transform.scale(
                  scale: 0.7,
                  child: Radio(
                      visualDensity: VisualDensity.compact,
                      fillColor: MaterialStateProperty.all(Colors.amberAccent),
                      activeColor: Colors.amberAccent,
                      value: 3,
                      groupValue: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      }),
                ),
                Text("07 days",
                    style: TextStyle(color: Colors.white, fontSize: 12)),
                Transform.scale(
                  scale: 0.7,
                  child: Radio(
                      visualDensity: VisualDensity.compact,
                      fillColor: MaterialStateProperty.all(Colors.amberAccent),
                      activeColor: Colors.amberAccent,
                      value: 4,
                      groupValue: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      }),
                ),
                Text("07 days",
                    style: TextStyle(color: Colors.white, fontSize: 12)),
              ],
            ),
            Row(
              children: [
                Transform.scale(
                  scale: 0.7,
                  child: Radio(
                      visualDensity: VisualDensity.compact,
                      fillColor: MaterialStateProperty.all(Colors.amberAccent),
                      activeColor: Colors.amberAccent,
                      value: 2,
                      groupValue: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      }),
                ),
                Text("07 days",
                    style: TextStyle(color: Colors.white, fontSize: 12)),
              ],
            ),
            Divider(
              color: Colors.white,
              indent: 15,
              thickness: 0.1,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "VIDEO QUALITY",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Transform.scale(
                  scale: 0.7,
                  child: Radio(
                      visualDensity: VisualDensity.compact,
                      fillColor: MaterialStateProperty.all(Colors.amberAccent),
                      activeColor: Colors.amberAccent,
                      value: 1,
                      groupValue: selectedValue2,
                      onChanged: (value) {
                        setState(() {
                          selectedValue2 = value;
                        });
                      }),
                ),
                Text("Good",
                    style: TextStyle(color: Colors.white, fontSize: 12)),
                Transform.scale(
                  scale: 0.7,
                  child: Radio(
                      visualDensity: VisualDensity.compact,
                      fillColor: MaterialStateProperty.all(Colors.amberAccent),
                      activeColor: Colors.amberAccent,
                      value: 2,
                      groupValue: selectedValue2,
                      onChanged: (value) {
                        setState(() {
                          selectedValue2 = value;
                        });
                      }),
                ),
                Text("Better",
                    style: TextStyle(color: Colors.white, fontSize: 12)),
                Transform.scale(
                  scale: 0.7,
                  child: Radio(
                      visualDensity: VisualDensity.compact,
                      fillColor: MaterialStateProperty.all(Colors.amberAccent),
                      activeColor: Colors.amberAccent,
                      value: 3,
                      groupValue: selectedValue2,
                      onChanged: (value) {
                        setState(() {
                          selectedValue2 = value;
                        });
                      }),
                ),
                Text("Best",
                    style: TextStyle(color: Colors.white, fontSize: 12)),
              ],
            ),
            Divider(
              color: Colors.white,
              indent: 15,
              thickness: 0.1,
            ),
            mediamSpace(),
            Text(
              "DEVICES",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 200,
              child: Text(
                "Screens you can watch on at the same time",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            smallSpace(),
            SizedBox(
              width: 400,
              child: DropdownButton<String>(
                hint: Text(
                  "Choose number of devices",
                  style: TextStyle(color: Colors.white),
                ),
                dropdownColor: Colors.grey,
                icon: Icon(Icons.keyboard_arrow_down_outlined),
                value: selectedValue3,
                onChanged: (newValue) {
                  setState(() {
                    selectedValue3 = newValue;
                  });
                },
                items: <DropdownMenuItem<String>>[
                  DropdownMenuItem<String>(
                    value: 'Option 1',
                    child: Text('1', style: TextStyle(color: Colors.white)),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Option 2',
                    child: Text('2', style: TextStyle(color: Colors.white)),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Option 3',
                    child: Text('3', style: TextStyle(color: Colors.white)),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Option 4',
                    child: Text('4', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "CANCEL AT ANY TIME",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(children: [
              Transform.scale(
                scale: 0.7,
                child: Radio(
                    visualDensity: VisualDensity.compact,
                    fillColor: MaterialStateProperty.all(Colors.amberAccent),
                    activeColor: Colors.amberAccent,
                    value: 1,
                    groupValue: selectedValue2,
                    onChanged: (value) {
                      setState(() {
                        selectedValue2 = value;
                      });
                    }),
              ),
              Text("Yes", style: TextStyle(color: Colors.white, fontSize: 12)),
              Transform.scale(
                scale: 0.7,
                child: Radio(
                    visualDensity: VisualDensity.compact,
                    fillColor: MaterialStateProperty.all(Colors.amberAccent),
                    activeColor: Colors.amberAccent,
                    value: 2,
                    groupValue: selectedValue2,
                    onChanged: (value) {
                      setState(() {
                        selectedValue2 = value;
                      });
                    }),
              ),
              Text("No", style: TextStyle(color: Colors.white, fontSize: 12)),
            ]),
            Divider(
              color: Colors.white,
              indent: 15,
              thickness: 0.1,
            ),
            Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.grey[700])),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PayMethod(),
                        ));
                  },
                  child: Text(
                    "CONTINUE \$89",
                    style: TextStyle(color: Colors.amberAccent,fontWeight: FontWeight.bold),
                  )),
            ),
            smallSpace(),
            Text(
              "By signing up you agree to our Privacy",
              style: TextStyle(color: Colors.white),
            ),
            smallSpace(),
            Text(
              "Policy and Terms",
              style: TextStyle(color: Colors.amber),
            ),
          ],
        ),
      ),
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
