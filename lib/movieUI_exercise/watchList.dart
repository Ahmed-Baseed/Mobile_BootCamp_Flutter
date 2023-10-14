import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_bootcamp_flutter/movieUI_exercise/controller/moviesController.dart';
import 'package:mobile_bootcamp_flutter/movieUI_exercise/model/movieDetails.dart';

class WatchList extends StatefulWidget {
  const WatchList({super.key});

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  @override
  Widget build(BuildContext context) {
    late List<MovieDetails> mc = [];
    return mc.isEmpty?Scaffold(
        backgroundColor: Color.fromRGBO(33, 37, 41, 1),
        appBar: AppBar(
          title: Text("WatchList"),
          backgroundColor: Color.fromRGBO(33, 37, 41, 1),
          iconTheme: IconThemeData(color: Colors.amber),
          elevation: 10,
        ),
        body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(Icons.list_rounded,size: 200,color: Colors.amber,),
          Text("Your List is Empty!".toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
           Text("go Back and Add Some Movies",style: TextStyle(color: Colors.white,fontSize: 15),)
        ],)),
         )
        :Scaffold(
        backgroundColor: Color.fromRGBO(33, 37, 41, 1),
        appBar: AppBar(
          title: Text("WatchList"),
          backgroundColor: Color.fromRGBO(33, 37, 41, 1),
          iconTheme: IconThemeData(color: Colors.amber),
          elevation: 10,
        ),
        body: ListView.builder(
            itemCount: mc.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.only(left: 15),
                child: SizedBox(
                  height: 200,
                  child: Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("${mc[index].imagePath}"),
                                fit: BoxFit.cover),
                          ),
                          padding: EdgeInsets.all(5),
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
                                      width: 40,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 12,
                                      color: Colors.amber[700],
                                    ),
                                    Text(
                                      "${mc[index].rating.toString()}",
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
                      Column(
                        children: [
                          SizedBox(
                              width: 110,
                              child: Text(
                                "${mc[index].name}",
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
                                    "${mc[index].category}",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.amber),
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
                  ),
                ),
              );
            }));
  }
}
