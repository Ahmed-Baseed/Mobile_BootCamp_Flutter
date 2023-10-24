
import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/core/components/whatchListComponents.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/features/model/movieDetails.dart';

// ignore: must_be_immutable
class WatchList extends StatefulWidget {
  WatchList({super.key, required this.mc});
  late List<MovieDetails> mc = [];

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  @override
  Widget build(BuildContext context) {
    return widget.mc.isEmpty
        ? Scaffold(
            backgroundColor: Color.fromRGBO(33, 37, 41, 1),
            appBar: AppBar(
              title: Text("WatchList"),
              backgroundColor: Color.fromRGBO(33, 37, 41, 1),
              iconTheme: IconThemeData(color: Colors.amber),
              elevation: 10,
            ),
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.list_rounded,
                  size: 200,
                  color: Colors.amber,
                ),
                Text(
                  "Your List is Empty!".toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "go Back and Add Some Movies",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )
              ],
            )),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Color.fromRGBO(33, 37, 41, 1),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.house_rounded,
                      color: Colors.white,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.notifications_active,
                      color: Colors.white,
                    ),
                    label: ""),
              ],
            ),
          )
        : Scaffold(
            backgroundColor: Color.fromRGBO(33, 37, 41, 1),
            appBar: AppBar(
              title: Text("WatchList"),
              backgroundColor: Color.fromRGBO(33, 37, 41, 1),
              iconTheme: IconThemeData(color: Colors.amber),
              elevation: 10,
            ),
            body: ListView.separated(
                separatorBuilder: (context, index) =>
                    Divider(color: Colors.white, indent: 15),
                itemCount: widget.mc.length,
                itemBuilder: (context, index) {
                  return MyWidget(
                    imagePath: widget.mc[index].imagePath,
                    name: widget.mc[index].name,
                    category: widget.mc[index].category,
                    onPressed: () {
                      widget.mc.removeAt(index);
                      setState(() {});
                    },
                  );
                }),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Color.fromRGBO(33, 37, 41, 1),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.house_rounded,
                      color: Colors.white,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.notifications_active,
                      color: Colors.white,
                    ),
                    label: ""),
              ],
            ),
          );
  }
}
