import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/day_36/controller/courseController.dart';
import 'package:mobile_bootcamp_flutter/day_36/view/courseAdd.dart';

class CourseList extends StatefulWidget {
  const CourseList({super.key});

  @override
  State<CourseList> createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  Widget emptyList() {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 3,
        ),
        Icon(
          Icons.hourglass_empty,
          size: 100,
        ),
        Text(
          "Nothing to Display",
          style: TextStyle(fontSize: 30),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Course Management"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    final a = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CourseAdd(),
                        ));
                    if (a) {
                      setState(() {});
                    }
                  },
                  child: Text("Add Course")),
            ],
          ),
          if (CourseConroller.courses.isEmpty) emptyList(),
          Expanded(
            child: SizedBox(
              child: ListView.builder(
                itemCount: CourseConroller.courses.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("${CourseConroller.courses[index].name}"),
                    subtitle: Text("${CourseConroller.courses[index].hours}"),
                    leading:
                        IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                    trailing: IconButton(
                        onPressed: () {
                          CourseConroller.courses.removeAt(index);
                          setState(() {});
                        },
                        icon: Icon(Icons.delete)),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
