// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class HomePageWidget extends StatelessWidget {
  String? imagePath, name, category;
  double? rating;
  Function()? onTap;
  HomePageWidget({
    Key? key,
    this.imagePath,
    this.name,
    this.category,
    this.rating,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("${imagePath}"), fit: BoxFit.cover),
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
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Icon(
                          Icons.star,
                          size: 12,
                          color: Colors.amber,
                        ),
                        Text(
                          "${rating.toString()}",
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
                  "${name}",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                )),
            SizedBox(
                width: 110,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${category}",
                      style: TextStyle(fontSize: 12, color: Colors.amber),
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
  }
}
