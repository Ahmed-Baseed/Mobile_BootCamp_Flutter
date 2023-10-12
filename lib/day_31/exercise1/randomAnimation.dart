import 'dart:math';

import 'package:flutter/material.dart';

class RandomAnimation extends StatefulWidget {
  const RandomAnimation({super.key});

  @override
  State<RandomAnimation> createState() => _RandomAnimationState();
}

class _RandomAnimationState extends State<RandomAnimation> {
  double h = 100;
  double w = 100;
  Color color = Colors.amber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: AnimatedContainer(
          duration: Duration(seconds: 3),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: h,
                  width: w,
                  color: Colors.amber,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  ElevatedButton(onPressed: () {
                    Random random = Random();

                    setState(() {
                      w = random.nextInt(300).toDouble();
                      h = random.nextInt(300).toDouble();
                    });
                  }, child: Icon(Icons.photo_size_select_large_sharp)),

                  ElevatedButton(onPressed: () {
                    Random random = Random();

                    setState(() {

                    });
                  }, child: Icon(Icons.color_lens))
                ],)
              ],
            ),
          ),
        ));
  }
}
