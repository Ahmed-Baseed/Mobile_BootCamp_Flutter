import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/day_80/task_app/model/task_model.dart';
import 'package:firebase_app/day_80/task_app/viewModel/taskVm.dart';
import 'package:firebase_app/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskHomeScreen extends StatelessWidget {
  TaskHomeScreen({super.key});

  Status? selectedStatus;
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TaskVM taskVM = TaskVM();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Task Manager'),
      ),
      body: FutureBuilder(
        future: taskVM.loadTasks(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 100,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Card(
                          child: ListTile(
                        title: Text('${snapshot.data![index].title}'),
                        subtitle: Text('${snapshot.data![index].description}'),
                        trailing: InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.grey[400],
                                borderRadius: BorderRadius.circular(10)),
                            child: Text('${snapshot.data![index].status!.value}'),
                          ),
                        ),
                        leading: PopupMenuButton(
                          icon: Icon(Icons.settings),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              child: Text('Update State'),
                              onTap: () {
                                // Provider.of<TaskVM>(context,listen: false).editTask();
                              },
                            ),
                            PopupMenuItem(
                              child: Text('Edit'),
                              onTap: () {
                                title.text = snapshot.data![index].title!;
                              },
                            ),
                            PopupMenuItem(
                              child: Text('Delete'),
                              onTap: () {
                                Provider.of<TaskVM>(context, listen: false)
                                    .removeTask(snapshot.data![index].docId.toString());
                              },
                            ),
                          ],
                        ),
                      )),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          } else {
            return Center(
              child: Text('No Data Available'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        foregroundColor: Colors.amber,
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                padding: EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height * 0.75,
                color: Colors.blueGrey,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Textfield(
                          controller: title, text: 'Title', isfalse: false),
                      Textfield(
                          controller: description,
                          text: 'Description',
                          isfalse: false),
                      Container(
                        padding: EdgeInsets.all(10),
                        width: 370,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade100,
                        ),
                        child: DropdownButton<Status>(
                          hint: Text('Status'),
                          dropdownColor: Colors.grey.shade100,
                          value: selectedStatus,
                          onChanged: (value) {
                            selectedStatus = value;
                          },
                          items: Status.values.map((Status value) {
                            return DropdownMenuItem<Status>(
                              value: value,
                              child: Text(value.toString().split('.').last),
                            );
                          }).toList(),
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.black)),
                        child: const Text('Add'),
                        onPressed: () {
                          if (title.text.isNotEmpty &&
                              description.text.isNotEmpty) {
                            final TaskModel newTask = TaskModel(
                              title: title.text,
                              description: description.text,
                              status: selectedStatus!,
                            );
                            Provider.of<TaskVM>(context, listen: false)
                                .addTask(newTask);

                            title.clear();
                            description.clear();

                            Navigator.pop(context);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
