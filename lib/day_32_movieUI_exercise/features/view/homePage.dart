import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/core/components/homePageComponenets.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/features/controller/moviesController.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/features/model/movieDetails.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/features/view/paymentPage.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/features/view/subscribePage.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/features/view/videoShow.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Icon> contentType = [
    Icon(
      Icons.movie,
      color: Colors.amber,
    ),
    Icon(
      Icons.all_out,
      color: Colors.amber,
    ),
    Icon(
      Icons.play_circle_filled_rounded,
      color: Colors.amber,
    ),
    Icon(
      Icons.bedroom_baby_rounded,
      color: Colors.amber,
    ),
    Icon(
      Icons.tv_rounded,
      color: Colors.amber,
    ),
  ];

  MoviesController moviesController = MoviesController();
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> list = [
      {'name': 'My Account', 'icon': Icons.person},
      {'name': 'About Us', 'icon': Icons.group},
      {'name': 'My Subscriptions', 'icon': Icons.subscriptions_rounded},
      {'name': 'Support', 'icon': Icons.support},
      {'name': 'Rate Us', 'icon': Icons.thumb_up_rounded},
      {'name': 'Sign Out', 'icon': Icons.logout_outlined},
    ];
    late List<MovieDetails> mc = [];
    moviesController.getAllmovie();
    return Scaffold(
      drawer: Drawer(
          backgroundColor: Color.fromRGBO(48, 49, 51, 1),
          child: Container(
            padding: EdgeInsets.only(top: 100),
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/profile.jpg"),
                        maxRadius: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ahmed Mohammed",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text("ahmedTestEmail@gmail.com",
                              style: TextStyle(color: Colors.white))
                        ],
                      )
                    ],
                  ),
                  for (int a = 0; a < 6; a++)
                    ListTile(
                      leading: Icon(list[a]['icon'], color: Colors.amber),
                      title: Text("${list[a]['name']}",
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                      onTap: () {},
                    ),
                ],
              ),
            ),
          )),
      backgroundColor: Color.fromRGBO(48, 49, 51, 1),
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/pxfuel.jpg"),
              fit: BoxFit.cover,
              opacity: 0.2,
            ),
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 15, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {
                      showDialog(
                        barrierColor: Colors.white.withOpacity(0.3),
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.amber,
                            icon: Icon(
                              Icons.movie_filter_outlined,
                              size: 60,
                            ),
                            content: Container(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: SizedBox(
                                  height: 130,
                                  width: 0,
                                  child: Column(
                                    children: [
                                      Text(
                                        'Subscribe Now to access premium content',
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      ElevatedButton(
                                          style: ButtonStyle(
                                              padding: MaterialStatePropertyAll(
                                                  EdgeInsets.all(15)),
                                              backgroundColor:
                                                  MaterialStatePropertyAll(
                                                      Colors.grey[700])),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      SubscriptionPlan(),
                                                ));
                                          },
                                          child: Text(
                                            "SUBSCRIBE NOW",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ],
                                  ),
                                )),
                          );
                        },
                      );
                    },
                    child: Text(
                      "TRENDING",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "NEWEST",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/watchList", arguments: mc);
                    },
                    child: Text(
                      "FOR YOU",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "POPULER",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    )),
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  maxRadius: 15,
                  backgroundImage: AssetImage("assets/images/profile.jpg"),
                )
              ],
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: FaIcon(FontAwesomeIcons.barsStaggered));
        }),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //part 1
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/pxfuel.jpg"),
                    fit: BoxFit.cover,
                    opacity: 0.2,
                  ),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/movie/trend/${index + 15}.jpg"),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.all(10),
                                  width: 220,
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MovieShow(),
                                      ));
                                },
                              );
                            }),
                      ),
                    ]),
              ),
              SizedBox(
                height: 80,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(48, 49, 51, 1),
                        ),
                        height: 200,
                        width: 110,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            contentType[index],
                            Text(
                              "${moviesController.movies[index].type}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              Divider(thickness: 8, color: Color.fromRGBO(33, 37, 41, 1)),
              //part 2
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "TRRNDING IN VIMU",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "SEE ALL",
                          style: TextStyle(fontSize: 11, color: Colors.white),
                        )),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15),
                child: SizedBox(
                  height: 200,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return HomePageWidget(
                          imagePath: moviesController.movies[index].imagePath,
                          category: moviesController.movies[index].category,
                          name: moviesController.movies[index].name,
                          rating: moviesController.movies[index].rating,
                          onTap: () {
                            mc.add(moviesController.movies[index]);
                          },
                        );
                      }),
                ),
              ),
              Divider(thickness: 8, color: Color.fromRGBO(33, 37, 41, 1)),
              //part 3
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "NEWEST",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "SEE ALL",
                          style: TextStyle(fontSize: 11, color: Colors.white),
                        )),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15),
                child: SizedBox(
                  height: 200,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return HomePageWidget(
                          imagePath:
                              moviesController.movies[index + 5].imagePath,
                          category: moviesController.movies[index + 5].category,
                          name: moviesController.movies[index + 5].name,
                          rating: moviesController.movies[index + 5].rating,
                          onTap: () {
                            mc.add(moviesController.movies[index + 5]);
                          },
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
