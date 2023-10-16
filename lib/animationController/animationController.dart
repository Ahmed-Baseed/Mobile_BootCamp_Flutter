import 'package:flutter/material.dart';

class AnimationControl extends StatefulWidget {
  const AnimationControl({super.key});

  @override
  State<AnimationControl> createState() => _AnimationControlState();
}

class _AnimationControlState extends State<AnimationControl>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> colorAn;
  // late Animation<BorderRadius?> rediusAn;
  late Animation<double?> sizeAn;
  double slideValue = 0;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    colorAn = ColorTween(begin: Colors.grey, end: Colors.amber[600])
        .animate(controller);
    sizeAn = TweenSequence<double>([
      TweenSequenceItem<double>(tween: Tween(begin: 80, end: 100), weight: 5),
      TweenSequenceItem<double>(tween: Tween(begin: 100, end: 80), weight: 5),
    ]).animate(controller);
    // rediusAn = BorderRadiusTween(
    //         begin: BorderRadius.circular(0), end: BorderRadius.circular(150))
    //     .animate(controller);
    // sizeAn = SizeTween(begin: Size(300,300) ,end: Size(100, 100)).animate(controller);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              return InkWell(
                  onTap: () {
                    if (controller.isCompleted)
                      controller.reverse();
                    else
                      controller.forward();
                  },
                 );
            },
          ),
          Transform.scale(
            scaleX: slideValue * 2,
            scaleY: slideValue * 2,
            child: Center(
                    child: Icon(Icons.notifications_active,
                        size: slideValue, color: Colors.amber),
                  ),
          ),
          Slider(
            value: slideValue,
            onChanged: (value) {
              slideValue = value;
              setState(() {});
            },
            max: 50,
            min: 0,
          )
        ],
      ),
      //
      // AnimatedBuilder(
      //   animation: controller,
      //   builder: (context, child) {
      //     return Center(
      //         child: InkWell(
      //       onTap: () {
      //         if (controller.status == AnimationStatus.completed)
      //           controller.reverse();
      //         else
      //           controller.forward();
      //       },
      //       child: Container(
      //         decoration: BoxDecoration(
      //           borderRadius: rediusAn.value,
      //           color: colorAn.value,
      //         ),
      //         height: 300,
      //         width: 300,
      //       ),
      //     ));
      //   },
      // ),
    );
  }
}
