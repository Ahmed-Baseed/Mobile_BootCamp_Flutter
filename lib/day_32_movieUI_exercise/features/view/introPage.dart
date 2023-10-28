import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/features/view/accountPage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}


class _IntroPageState extends State<IntroPage> {
  List<Map<String, dynamic>> mapList = [
  {
    'icon': Icons.tv,
    'title': 'WATCH ON ANY DEVICE',
    'description': 'Connect to using your favorite devices.',
  },
  {
    'icon': Icons.play_circle_fill,
    'title': 'UNLIMITED ENTERTAINMENT',
    'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  },
  {
    'icon': Icons.cut_rounded,
    'title': 'NO ANNOYING CONTRACTS',
    'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  },
];
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Stack(
                children: [
                  PageView.builder(
                      controller: controller,
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          padding:
                              EdgeInsets.only(left: 30, bottom: 250, right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                mapList[index]['icon'],
                                color: Colors.amber,
                                size: 100,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${mapList[index]['title']}",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${mapList[index]['description']}",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  if (index == 2)
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Account(),
                                              ));
                                        },
                                        child: Row(
                                          children: [
                                            Text("Next",
                                                style: TextStyle(
                                                    color: Colors.amber)),
                                            Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color: Colors.amber,
                                            )
                                          ],
                                        )),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                  Positioned(
                    bottom: 220,
                    left: 30,
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: const WormEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        dotColor: Colors.white,
                        activeDotColor: Colors.amber,
                        type: WormType.normal,
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
