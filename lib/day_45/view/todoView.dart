import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/day_45/controller/todoController.dart';
import 'package:mobile_bootcamp_flutter/day_45/view/addTodo.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  late TodoController todoController;
  @override
  void initState() {
    todoController = TodoController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[300],
        title: Text("Todo List"),
        centerTitle: true,
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body: FutureBuilder(
        future: todoController.loadTodo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Card(
                          color: Colors.orange[50],
                          child: ListTile(
                              title: Text("${snapshot.data![index].todo}"),
                              subtitle:
                                  Text("${snapshot.data![index].completed}"),
                              leading: CircleAvatar(
                                  backgroundColor: Colors.amber,
                                  child: Center(
                                    child: Text(
                                      "${snapshot.data![index].id}",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  )),
                              trailing: PopupMenuButton(
                                icon: Icon(Icons.more_vert),
                                itemBuilder: (context) => [
                                  PopupMenuItem(child: Text("Edit")),
                                  PopupMenuItem(child: Text("Delete")),
                                ],
                              ))));
                },
              );
            } else {
              return Center(
                child: Text("No Data Available"),
              );
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddTodo(todoController: todoController),));
          },
          child: Text("Add Todo",style: TextStyle(color: Colors.black),),
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.amber))),
    );
  }
}
