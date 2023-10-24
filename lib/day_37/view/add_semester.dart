import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/day_37/model/semesterModel.dart';
import 'package:mobile_bootcamp_flutter/day_37/view/add_courses.dart';

class Semester extends StatefulWidget {
  const Semester({super.key});

  @override
  State<Semester> createState() => _SemesterState();
}

class _SemesterState extends State<Semester> {
  List<SemesterModel> semesters = [];

  void addSemester(SemesterModel s) {
    setState(() {
      semesters.add(s);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6544B8),
      ),
      body: semesters.isEmpty
          ? Container()
          : Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "summer 2023",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: ListTile(
                        title: Text("Your GPA"),
                        subtitle: Text(
                          "3.85",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                      )),
                      Spacer(),
                      Expanded(
                          child: ListTile(
                        title: Text("Total Units"),
                        subtitle: Text(
                          "16",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                    itemCount: semesters.length,
                    itemBuilder: (context, index) => ExpansionPanelList(
                      expansionCallback: (panelIndex, isExpanded) => {},
                      children: [
                        ExpansionPanel(
                            headerBuilder: (BuildContext ctx,
                                    bool isExpanded) =>
                                Container(
                                    padding: EdgeInsets.only(
                                        top: 30, bottom: 30, left: 10),
                                    child: Text(
                                        '${semesters[index].name} ${semesters[index].year}')),
                            body: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    title: Text("Credits : 0"),
                                    subtitle: Text("Grade(letter) : -"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Course()));
                                    },
                                    child: Text("Add Coursees"),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Color(0xff6544B8))),
                                  )
                                ],
                              ),
                            ),
                            isExpanded: false),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Color(0xff6544B8))),
        onPressed: () {
          showAddSemesterDialog();
        },
        child: SizedBox(
          width: 130,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.add_task_rounded),
              Text("Add Semesters"),
            ],
          ),
        ),
      ),
    );
  }

  void showAddSemesterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String? name;
        int? year;
        return AlertDialog(
          content: SizedBox(
            height: 130,
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Semester Name',
                  ),
                  onChanged: (value) => name = value,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Semester Year',
                  ),
                  onChanged: (value) => year = year,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                addSemester(SemesterModel(name: name, year: year));
                Navigator.pop(context);
                setState(() {});
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
