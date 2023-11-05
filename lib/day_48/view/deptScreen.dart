import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/day_48/controller/DeptController.dart';
import 'package:mobile_bootcamp_flutter/day_48/view/addDept.dart';

class Dept_screen extends StatefulWidget {
  const Dept_screen({super.key});

  @override
  State<Dept_screen> createState() => _Dept_screenState();
}

class _Dept_screenState extends State<Dept_screen> {
  late DeptController deptController;
  bool check = true;

  @override
  void initState() {
    deptController = DeptController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Departments"),
        backgroundColor: Colors.deepPurple,
      ),
      body: FutureBuilder(
        future: deptController.getDepartment(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: ListTile(
                        title: Text("${snapshot.data![index].name}"),
                        leading: CircleAvatar(
                          backgroundColor: snapshot.data![index].active!
                              ? Colors.green
                              : Colors.red,
                          child: Text("${index + 1}"),
                        ),
                        trailing: PopupMenuButton(
                            itemBuilder: (context) => [
                                  PopupMenuItem(
                                    value: 1,
                                    child: Text("Edit"),
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            actions: [
                                              TextField(
                                                decoration: InputDecoration(
                                                    hintText: "Name"),
                                              ),
                                              Container(

                                                child: CheckboxListTile(
                                                  title:
                                                      Text("Active Department"),
                                                  value: check,
                                                  onChanged: (value) {
                                                    check = value!;
                                                    setState(() {});
                                                  },
                                                ),
                                              ),
                                              ElevatedButton(
                                                  onPressed: () async {},
                                                  child: Text("Add"),
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStatePropertyAll(
                                                            Colors.deepPurple),
                                                  ))
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  PopupMenuItem(
                                    value: 2,
                                    child: Text("Delete"),
                                    onTap: () {},
                                  ),
                                  PopupMenuItem(
                                    value: 3,
                                    child: Text("Courses"),
                                    onTap: () {},
                                  ),
                                ])),
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
      floatingActionButton: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
              padding: MaterialStatePropertyAll(EdgeInsets.all(15)),
              backgroundColor: MaterialStatePropertyAll(Colors.deepPurple)),
          onPressed: () async {
            bool? b = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddDept(
                    deptController: deptController,
                  ),
                ));
            if (b != null) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Add Successfully'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {},
                ),
              ));
            }
            setState(() {});
          },
          child: Text("Add")),
    );
  }
}
