import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  double w = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TweenAnimationBuilder(
        tween: Tween<double>(begin: 100, end: w),
        duration: Duration(seconds: 1),
        builder: (context, value, child) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.amber,
                height: 300,
                width: value,
              ),
              ElevatedButton(
                  onPressed: () {
                    w = w == 100 ? 300 : 100;
                    setState(() {});
                  },
                  child: Icon(Icons.replay))
            ],
          ),
        ),
      ),
    );
  }
}
