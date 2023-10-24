import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/core/components/homePageComponenets.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/features/controller/moviesController.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/features/model/movieDetails.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/features/view/paymentPage.dart';
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
      color: Colors.amber[500],
    ),
    Icon(
      Icons.all_out,
      color: Colors.amber[500],
    ),
    Icon(
      Icons.play_circle_filled_rounded,
      color: Colors.amber[500],
    ),
    Icon(
      Icons.bedroom_baby_rounded,
      color: Colors.amber[500],
    ),
    Icon(
      Icons.tv_rounded,
      color: Colors.amber[500],
    ),
  ];
  MoviesController moviesController = MoviesController();
  @override
  Widget build(BuildContext context) {
    late List<MovieDetails> mc = [];
    moviesController.getAllmovie();
    return Scaffold(
      drawer: Drawer(
          backgroundColor: Color.fromRGBO(48, 49, 51, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profile.jpg"),
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
              ListTile(
                leading: Icon(Icons.person, color: Colors.white),
                title:
                    Text("My Account", style: TextStyle(color: Colors.white)),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.group, color: Colors.white),
                title: Text("About Us", style: TextStyle(color: Colors.white)),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.subscriptions_rounded, color: Colors.white),
                title: Text("My Subscriptions",
                    style: TextStyle(color: Colors.white)),
                onTap: () {},
              ),
              ListTile(
                leading:
                    Icon(Icons.account_balance_wallet, color: Colors.white),
                title: Text("Payment Method",
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentPage(),
                      ));
                },
              ),
              ListTile(
                leading: Icon(Icons.support_rounded, color: Colors.white),
                title: Text("Support", style: TextStyle(color: Colors.white)),
                onTap: () {},
              ),
              ListTile(
                leading:
                    Icon(Icons.thumbs_up_down_rounded, color: Colors.white),
                title: Text("Rate Us", style: TextStyle(color: Colors.white)),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.logout_rounded, color: Colors.white),
                title: Text("Logout", style: TextStyle(color: Colors.white)),
                onTap: () {},
              ),
            ],
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
                    onPressed: () {},
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
                          imagePath: moviesController.movies[index+5].imagePath,
                          category: moviesController.movies[index+5].category,
                          name: moviesController.movies[index+5].name,
                          rating: moviesController.movies[index+5].rating,
                          onTap: () {
                            mc.add(moviesController.movies[index+5]);
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
