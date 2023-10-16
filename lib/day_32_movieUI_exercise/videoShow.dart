import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/controller/moviesController.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/model/movieDetails.dart';
// import 'package:video_player/video_player.dart';

class MovieShow extends StatefulWidget {
  const MovieShow({super.key});

  @override
  State<MovieShow> createState() => _MovieShowState();
}

class _MovieShowState extends State<MovieShow> {
 
  // late VideoPlayerController _controller;

  // void initState() {
  //   super.initState();
  //   _controller = VideoPlayerController.asset("assets/images/video/movie.mp4")
  //     ..initialize().then((_) {
  //       setState(() {});
  //     });
  // }

  MoviesController moviesController = MoviesController();
  @override
  Widget build(BuildContext context) {
    late List<MovieDetails> mc = [];
    moviesController.getAllmovie();
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 37, 41, 1),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.amber),
        title: Text("${moviesController.movies[0].name}"),
        backgroundColor: Color.fromRGBO(33, 37, 41, 1),
      ),
     
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // _controller.value.isInitialized
              //     ? AspectRatio(
              //         aspectRatio: _controller.value.aspectRatio,
              //         child: VideoPlayer(_controller),
              //       )
              //     : Container(),

              // FloatingActionButton(
              //   onPressed: () {
              //     setState(() {
              //       _controller.value.isPlaying
              //           ? _controller.pause()
              //           : _controller.play();
              //     });
              //   },
              //   child: Icon(
              //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              //   ),
              // ),

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
                                            "${moviesController.movies[0].imagePath}"),
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
                                              "${moviesController.movies[0].rating.toString()}",
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 110,
                                ),
                                SizedBox(
                                    width: 110,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${moviesController.movies[0].name}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                        FaIcon(
                                          FontAwesomeIcons.heart,
                                          color: Colors.white,
                                          size: 15,
                                        )
                                      ],
                                    )),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.watch_later_outlined,
                                      size: 15,
                                      color: Colors.amber,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "01:40:22",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    )
                                  ],
                                )
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
                        return Column(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "${moviesController.movies[index + 10].imagePath}"),
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
                                            "${moviesController.movies[index + 10].rating.toString()}",
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
                                          "${moviesController.movies[index + 10].name}",
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
                                          "${moviesController.movies[index + 10].category}",
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
