import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mobile_bootcamp_flutter/day_59/model/tasks.dart';

class TaskManage extends StatefulWidget {
  const TaskManage({super.key});

  @override
  State<TaskManage> createState() => _TaskManageState();
}

class _TaskManageState extends State<TaskManage> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  late Box box;
  @override
  void initState() {
    box = Hive.box("Tasks");
  }

  @override
  Widget build(BuildContext context) {
    List<Tasks> t = box.values.map<Tasks>((e) => e).toList();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: SizedBox(
                    height: 130,
                    child: Column(
                      children: [
                        TextField(
                          controller: title,
                          decoration: InputDecoration(
                            hintText: 'Title',
                          ),
                        ),
                        TextField(
                          controller: description,
                          decoration: InputDecoration(
                            hintText: 'Description',
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Tasks task = Tasks(
                            title: title.text, description: description.text);
                        box.add(task);
                        setState(() {});
                      },
                      child: Text('Save'),
                    ),
                  ],
                );
              },
            );
          },
          child: Icon(Icons.add)),
      body: t.isNotEmpty
          ? ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                return Container(
                    child: ListTile(
                  title: Text(t[index].title!),
                  subtitle: Text(t[index].description!),
                ));
              },
            )
          : Text('Empty'),
    );
  }
}
