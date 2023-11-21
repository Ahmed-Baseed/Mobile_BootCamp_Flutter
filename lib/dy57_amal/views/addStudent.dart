import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/features/view/signinPage.dart';
import 'package:mobile_bootcamp_flutter/dy57_amal/db_helper.dart';
import 'package:mobile_bootcamp_flutter/dy57_amal/entites/department.dart';
import 'package:mobile_bootcamp_flutter/dy57_amal/entites/student.dart';
import 'package:mobile_bootcamp_flutter/dy57_amal/views/showStudent.dart';

class Add_student extends StatefulWidget {
  const Add_student({super.key});

  @override
  State<Add_student> createState() => _Add_studentState();
}

class _Add_studentState extends State<Add_student> {
  TextEditingController studentName = TextEditingController();
  TextEditingController phoneNum = TextEditingController();
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3c6e71),
      body: Stack(
        children: [
          Positioned(
            top: 150,
            left: 85,
            child: Hero(
                tag: 1,
                child: Image.asset("assets/images/FGF.png", height: 50)),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 80),
              height: MediaQuery.of(context).size.height * 0.65,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  color: Color(0xffd9d9d9)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      controller: studentName,
                      style: TextStyle(color: Color(0xff3c6e71)),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff3c6e71))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Color(0xff3c6e71))),
                          labelText: 'Full Name',
                          labelStyle: TextStyle(color: Color(0xff3c6e71))),
                    ),
                    mediamSpace(),
                    TextFormField(
                      controller: phoneNum,
                      style: TextStyle(color: Color(0xff3c6e71)),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff3c6e71))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Color(0xff3c6e71))),
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(color: Color(0xff3c6e71))),
                    ),
                    mediamSpace(),
                    FutureBuilder(
                      future:
                          DBHelper.database.departmentDao.getAllDepartments(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return DropdownButton(
                              value: snapshot.data![0].id,
                              items: snapshot.data!
                                  .map((e) => DropdownMenuItem(
                                      value: e.id, child: Text(e.name!)))
                                  .toList(),
                              isExpanded: true,
                              onChanged: (val) {});
                        }else{
                          return Text("no departments");
                        }
                      },
                    ),
                    mediamSpace(),
                    CheckboxListTile(
                      title: Text('Active'),
                      value: isActive,
                      onChanged: (value) {
                        setState(() {
                          isActive = value!;
                        });
                      },
                    ),
                    mediamSpace(),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Color(0xff3c6e71))),
                        onPressed: () {
                          Student student = Student(
                              name: studentName.text,
                              phoneNo: phoneNum.text,
                              active: isActive);
                          DBHelper.database.studentDao.AddStudent(student);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowStudent(),
                              ));
                          setState(() {});
                        },
                        child: Text("Add")),
                    mediamSpace(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
