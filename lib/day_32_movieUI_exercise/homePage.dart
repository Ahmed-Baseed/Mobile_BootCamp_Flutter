import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/controller/moviesController.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/model/movieDetails.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/paymentPage.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/videoShow.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/watchList.dart';

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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => WatchList()));
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
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                mc.add(moviesController.movies[index]);
                                
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "${moviesController.movies[index].imagePath}"),
                                        fit: BoxFit.cover),
                                  ),
                                  padding: EdgeInsets.all(5),
                                  margin: EdgeInsets.all(5),
                                  height: 150,
                                  width: 110,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.hd,
                                              color: Colors.amber[600],
                                            ),
                                            SizedBox(
                                              width: 40,
                                            ),
                                            Icon(
                                              Icons.star,
                                              size: 12,
                                              color: Colors.amber[700],
                                            ),
                                            Text(
                                              "${moviesController.movies[index].rating.toString()}",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            Column(
                              children: [
                                SizedBox(
                                    width: 110,
                                    child: Text(
                                      "${moviesController.movies[index].name}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    )),
                                SizedBox(
                                    width: 110,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${moviesController.movies[index].category}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.amber),
                                        ),
                                        FaIcon(
                                          FontAwesomeIcons.heart,
                                          color: Colors.white,
                                          size: 15,
                                        )
                                      ],
                                    )),
                              ],
                            )
                          ],
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
                        return Column(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "${moviesController.movies[index + 5].imagePath}"),
                                      fit: BoxFit.cover),
                                ),
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.all(5),
                                height: 150,
                                width: 110,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.hd,
                                            color: Colors.amber[600],
                                          ),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 12,
                                            color: Colors.amber[700],
                                          ),
                                          Text(
                                            "${moviesController.movies[index + 5].rating.toString()}",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                            Column(
                              children: [
                                SizedBox(
                                    width: 110,
                                    child: Wrap(
                                      children: [
                                        Text(
                                          "${moviesController.movies[index + 5].name}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                    width: 110,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${moviesController.movies[index + 5].category}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.amber),
                                        ),
                                        FaIcon(
                                          FontAwesomeIcons.heart,
                                          color: Colors.white,
                                          size: 15,
                                        )
                                      ],
                                    )),
                              ],
                            )
                          ],
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
