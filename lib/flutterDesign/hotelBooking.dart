import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/flutterDesign/hotelScreen.dart';
import 'package:mobile_bootcamp_flutter/flutterDesign/profileScreen.dart';
import 'package:mobile_bootcamp_flutter/flutterDesign/settingsScreen.dart';

class HotelBooking extends StatefulWidget {
  const HotelBooking({super.key});

  @override
  State<HotelBooking> createState() => _HotelBookingState();
}

class _HotelBookingState extends State<HotelBooking> {
  List<Widget> navigation = [Profile(),Settings(),Hotel()];
  int index=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, Ahmed",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Find Deals",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          ClipRRect(
                            child: Image.asset(
                              "assets/images/img.JPG",
                              height: 60,
                              width: 60,
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: "Search City, Hotel etc..",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Popular Places",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text("View all"),
                        ],
                      ),
                    ]),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/hotel1.jpg"),
                                  fit: BoxFit.cover),
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          height: 200,
                          width: 130,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Maiami",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "783 proparties",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ));
                    }),
              ),
              Container(
                 margin: EdgeInsets.only(right: 15, left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Places",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text("View all"),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/hotel1.jpg"),
                                  fit: BoxFit.cover),
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          height: 200,
                          width: 130,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Maiami",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "783 proparties",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ));
                    }),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (x){
          index=x;
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.airline_seat_individual_suite), label: "Hotels"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settiengs"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Profile")
        ],
      ),
    ));
  }
}
