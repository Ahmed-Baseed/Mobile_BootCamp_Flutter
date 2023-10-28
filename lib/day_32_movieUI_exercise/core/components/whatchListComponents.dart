// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyWidget extends StatelessWidget {
  String? imagePath;
  String? name;
  String? category;
  Function()? onPressed;
  MyWidget({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.category,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Random a = Random();

    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 15, top: 15),
          child: SizedBox(
            height: 90,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("${imagePath}"), fit: BoxFit.cover),
                  ),
                  margin: EdgeInsets.all(5),
                  height: 90,
                  width: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.play_arrow_rounded,
                          size: 45, color: Colors.amber)
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.hd,
                      color: Colors.amber,
                    ),
                    Text(
                      "${name}",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                    Text(
                      "${category}",
                      style: TextStyle(fontSize: 12, color: Colors.amber),
                    ),
                    RatingBar.builder(
                      itemSize: 12,
                      initialRating: a.nextDouble() * 4,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      Icons.remove_circle,
                      color: Colors.red,
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
