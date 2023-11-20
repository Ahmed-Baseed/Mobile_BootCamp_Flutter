import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/dy57_amal/db_helper.dart';

class ShowStudent extends StatefulWidget {
  const ShowStudent({super.key});

  @override
  State<ShowStudent> createState() => _ShowStudentState();
}

class _ShowStudentState extends State<ShowStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3c6e71),
      body: Stack(
        children: [
          Positioned(
            top: 60,
            left: 15,
            child: Hero(
                tag: 1,
                child: Image.asset("assets/images/FGF.png", height: 30)),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 80),
              height: MediaQuery.of(context).size.height * 0.85,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  color: Color(0xffd9d9d9)),
              child: FutureBuilder(
                future: DBHelper.database.studentDao.getAllStudents(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                              title: Text("${snapshot.data![index].name}"),
                              subtitle:
                                  Text("${snapshot.data![index].phoneNo}"),
                              leading: Text("${snapshot.data![index].active}"),
                              trailing: SizedBox(
                                width: 96,
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.edit),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        DBHelper.database.studentDao
                                            .deletAllStudent();
                                        setState(() {});
                                      },
                                      icon: Icon(Icons.delete),
                                    ),
                                  ],
                                ),
                              ));
                        },
                      );
                    } else {
                      return Center(
                        child: Text("No Data Available"),
                      );
                    }
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
