// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:mobile_bootcamp_flutter/day_45/controller/todoController.dart';
import 'package:mobile_bootcamp_flutter/day_45/model/todoModel.dart';

class AddTodo extends StatefulWidget {
  late TodoController todoController;
  AddTodo({
    Key? key,
    required this.todoController,
  }) : super(key: key) {
    todoController = todoController;
  }

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Add Todo"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: "Title"),
            ),
            ElevatedButton(
              onPressed: () async{
                Todo todo = Todo();
                todo.todo =textEditingController.text;
                todo.completed = true;
                todo.userId = 1;
                bool b = await widget.todoController.postTodo(todo);
                if(b == true){
                  
                }
                
              },
              child: Text("Submit"),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.amber),
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 150))),
            )
          ],
        ),
      ),
    );
  }
}
