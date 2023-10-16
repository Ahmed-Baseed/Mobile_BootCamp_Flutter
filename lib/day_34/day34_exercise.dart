import 'package:flutter/material.dart';

class Day34_Exercise extends StatefulWidget {
  const Day34_Exercise({super.key});

  @override
  State<Day34_Exercise> createState() => _Day34_ExerciseState();
}

class _Day34_ExerciseState extends State<Day34_Exercise>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Size?> sizeAn;

  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    

    super.initState();
  }

  get(context){
   return sizeAn =
        SizeTween(begin: Size(0, 0), end: Size(0, MediaQuery.of(context).size.height/2)).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.blue,
      body: InkWell(
        onTap: () {
          if (controller.isCompleted)
            controller.reverse();
          else
            controller.forward();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AnimatedBuilder(
              animation: controller,
              builder: (context, _) {
                return Container(
                  color: Colors.grey,
                  height: get(context).value!.height,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
