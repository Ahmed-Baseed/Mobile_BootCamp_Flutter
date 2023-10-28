import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/core/components/homePageComponenets.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/features/controller/moviesController.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/features/model/movieDetails.dart';
import 'package:video_player/video_player.dart';

class MovieShow extends StatefulWidget {
  const MovieShow({super.key});

  @override
  State<MovieShow> createState() => _MovieShowState();
}

class _MovieShowState extends State<MovieShow> {
  final FlickManager flickManager = FlickManager(
    videoPlayerController: VideoPlayerController.asset(
      'assets/images/video/movie.mp4',
    ),
  );

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
              AspectRatio(
                aspectRatio: 16 / 9,
                child: FlickVideoPlayer(flickManager: flickManager),
              ),
              ListTile(
                title: Text(
                  "Better Call Soul",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: Row(
                  children: [
                    Icon(
                      Icons.hd,
                      color: Colors.amber,
                    ),
                    Padding(padding: EdgeInsets.only(right: 5)),
                    Text(
                      "Action Movie",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                    Spacer(),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 10,
                    ),
                    Text(
                      " ${moviesController.movies[1].rating}",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              Divider(thickness: 1, color: Colors.black,endIndent: 15,indent: 15),
              //part 2
              Container(
                margin: EdgeInsets.only(left: 20,top: 10),
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
