import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Dio_Lecture extends StatefulWidget {
  const Dio_Lecture({super.key});

  @override
  State<Dio_Lecture> createState() => _Dio_LectureState();
}

class _Dio_LectureState extends State<Dio_Lecture> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: loadProduct(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              Map<String, dynamic> content = jsonDecode(snapshot.data!);
              List<dynamic> products = content['products'];
              return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Stack(
                        children: [
                          Card(
                            color: Colors.grey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(40)),
                                  child: Image.network(
                                      "${products[index]['thumbnail']}"),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Text("${products[index]['title']}",style: TextStyle(fontSize: 20),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            } else {
              return Text("No data available");
            }
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

Future<String?> loadProduct() async {
  Dio d = Dio();
  Response<String> serverResponse =
      await d.get("https://dummyjson.com/products");
  return serverResponse.data;
}
