import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/core/components/homePageComponenets.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/features/controller/moviesController.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/features/model/movieDetails.dart';
// import 'package:video_player/video_player.dart';

class MovieShow extends StatefulWidget {
  const MovieShow({super.key});

  @override
  State<MovieShow> createState() => _MovieShowState();
}

class _MovieShowState extends State<MovieShow> {
  MoviesController moviesController = MoviesController();
  @override
  Widget build(BuildContext context) {
    late List<MovieDetails> mc = [];
    moviesController.getAllmovie();
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 37, 41, 1),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.amber),
        title: Text("Better Call Saul"),
        backgroundColor: Color.fromRGBO(33, 37, 41, 1),
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
                    opacity: 1,
                  ),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 250,
                      ),
                    ]),
              ),

              Divider(thickness: 8, color: Color.fromRGBO(33, 37, 41, 1)),
              //part 2
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "SEASON 1",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "SEASON 2",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "SEASON 3",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
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
                              "assets/images/movie/trend/betterCallSaul.jpg",
                          name: "Better Call Saul",
                          rating: moviesController.movies[index].rating,
                          category: "01:04:12",
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
                      "RECOMMENDED FOR YOU",
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
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return HomePageWidget(
                          imagePath:
                              moviesController.movies[index + 10].imagePath,
                          category:
                              moviesController.movies[index + 10].category,
                          name: moviesController.movies[index + 10].name,
                          rating: moviesController.movies[index + 10].rating,
                          onTap: () {
                            mc.add(moviesController.movies[index + 10]);
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
