import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/day_79/task_app/model/task_model.dart';
import 'package:mobile_bootcamp_flutter/day_79/task_app/viewModel/taskVm.dart';
import 'package:mobile_bootcamp_flutter/day_79/task_app/widgets/textfield.dart';
import 'package:provider/provider.dart';

class TaskHomeScreen extends StatelessWidget {
  TaskHomeScreen({super.key});

  Status? selectedStatus;
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Task Manager'),
      ),
      body: Consumer<TaskVM>(
        builder: (context, tvm, child) {
          return ListView.builder(
            itemCount: tvm.tasks.length,
            itemBuilder: (context, index) {
              TaskModel task = tvm.tasks[index];
              if (tvm.tasks.length > 0) {
                return SizedBox(
                  height: 100,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Card(
                        child: ListTile(
                      title: Text('${task.title}'),
                      subtitle: Text('${task.description}'),
                      trailing: InkWell(
                        onTap: () {
                          
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(10)),
                          child: Text('${task.status.value}'),
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
                              title.text = task.title;
                            },
                          ),
                          PopupMenuItem(
                            child: Text('Delete'),
                            onTap: () {
                              Provider.of<TaskVM>(context, listen: false)
                                  .removeTask(task);
                            },
                          ),
                        ],
                      ),
                    )),
                  ),
                );
              } else {
                return Center(
                  child: Text(
                    'No Task Today',
                    style: TextStyle(color: Colors.black),
                  ),
                );
              }

              // if (tvm.tasks.length == 0) {

              // }
            },
          );
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
