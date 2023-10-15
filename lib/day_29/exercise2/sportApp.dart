import 'package:flutter/material.dart';

styleTitle() {
  return const TextStyle(color: Colors.black87, fontSize: 25);
}

class SportApp extends StatelessWidget {
  const SportApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "News",
            style: styleTitle(),
          ),
          actions: const [
            Icon(
              Icons.more_vert,
              color: Colors.black87,
            )
          ],
          bottom: const TabBar(
              labelColor: Colors.black,
              indicatorColor: Colors.black45,
              indicatorWeight: 4,
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  text: "For you",
                ),
                Tab(
                  text: "Latest",
                ),
                Tab(
                  text: "Tranfers",
                ),
                Tab(
                  text: "Leagues",
                ),
              ]),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                margin:
                    EdgeInsets.only(top: 25, left: 25, right: 25, bottom: 0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "assets/images/bg1.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                        left: 80,
                        top: 60,
                        child: Container(
                          child: Image.asset(
                            "assets/images/moSalah.png",
                            height: 250,
                          ),
                        )),
                  ],
                ),
              );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
