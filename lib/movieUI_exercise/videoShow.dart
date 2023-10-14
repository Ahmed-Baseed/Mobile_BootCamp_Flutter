import 'package:flutter/material.dart';

class MovieShow extends StatefulWidget {
  const MovieShow({super.key});

  @override
  State<MovieShow> createState() => _MovieShowState();
}

class _MovieShowState extends State<MovieShow> {
  // FlickManager flickManager = FlickManager(
  //   videoPlayerController: VideoPlayerController.asset("assets/images/video/movie.mp4"),
  // );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.amber),
        title: Text("Payment Method"),
        backgroundColor: Color.fromRGBO(33, 37, 41, 1),
      ),
      // body:  AspectRatio(
      //   aspectRatio: 16 / 9,
      //   child: FlickVideoPlayer(flickManager: flickManager),
      // ),
    );
  }
}