import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/features/view/signinPage.dart';
import 'package:mobile_bootcamp_flutter/dy57_amal/db_helper.dart';
import 'package:mobile_bootcamp_flutter/dy57_amal/entites/student.dart';
import 'package:mobile_bootcamp_flutter/dy57_amal/views/addStudent.dart';

class ShowStudent extends StatefulWidget {
  const ShowStudent({super.key});

  @override
  State<ShowStudent> createState() => _ShowStudentState();
}

class _ShowStudentState extends State<ShowStudent> {
  Student s = Student();
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
                          return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        width: 1, color: Color(0xff3c6e71))),
                                child: ListTile(
                                    title:
                                        Text("${snapshot.data![index].name}"),
                                    subtitle: Text(
                                        "${snapshot.data![index].phoneNo}"),
                                    leading: snapshot.data![index].active ==
                                            true
                                        ? Icon(
                                            Icons.circle,
                                            color: Colors.green,
                                          )
                                        : Icon(Icons.circle, color: Colors.red),
                                    trailing: SizedBox(
                                      width: 96,
                                      child: Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              DBHelper.database.studentDao.updateStudent(s);
                                            },
                                            icon: Icon(
                                              Icons.edit,
                                              color: Color(0xff3c6e71),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              DBHelper.database.studentDao
                                                  .deleteStudent(snapshot
                                                      .data![index].id!);
                                              setState(() {});
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              color: Color(0xff3c6e71),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                              mediamSpace()
                            ],
                          );
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
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff3c6e71),
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Add_student(),
                ));
          }),
    );
  }
}
