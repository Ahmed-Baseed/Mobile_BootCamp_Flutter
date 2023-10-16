import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class FlipAnimation extends StatefulWidget {
  const FlipAnimation({super.key});

  @override
  State<FlipAnimation> createState() => _FlipAnimationState();
}

class _FlipAnimationState extends State<FlipAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40,),
            FlipCard(
              
            front: Container(height: 300,width: 200,color: Colors.black,child: Image.asset("assets/images/profile.jpg"),),
            
             back: Container(height: 300,width: 200,color: Colors.black45,child: Center(child: Text("Ahmed Basaeed"))),
             
             )
          ],
        ),
      ),
    );
  }
}
