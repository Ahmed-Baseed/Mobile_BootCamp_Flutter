import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_bootcamp_flutter/day_36/controller/courseController.dart';
import 'package:mobile_bootcamp_flutter/day_36/view/courseList.dart';

class CourseAdd extends StatefulWidget {
  const CourseAdd({super.key});

  @override
  State<CourseAdd> createState() => _CourseAddState();
}

class _CourseAddState extends State<CourseAdd> {
  CourseConroller courseConroller = CourseConroller();
  TextEditingController nameController = TextEditingController();
  TextEditingController hourController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Course"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                label: Text("Course Name"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: hourController,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                label: Text("Course Hours"),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  String name = nameController.text;
                  double hours = int.parse(hourController.text).toDouble();
                  courseConroller.addCourse(name, hours);
                  Navigator.pop(context,true);
                },
                child: Text("Save")),
          ],
        ),
      ),
    );
  }
}
