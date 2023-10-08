import 'package:flutter/material.dart';

class Todo {
  String title;
  String description;

  Todo({
    required this.title,
    required this.description,
  });
}

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<Todo> todos = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void addTodo() {
    setState(() {
      Todo newTodo = Todo(
        title: titleController.text,
        description: descriptionController.text,
      );
      todos.add(newTodo);
      titleController.clear();
      descriptionController.clear();
    });
  }

  void removeTodo() {
    setState(() {
      Todo newTodo = Todo(
        title: titleController.text,
        description: descriptionController.text,
      );
      todos.remove(newTodo);
      titleController.clear();
      descriptionController.clear();
    });
  }

  Widget _buildTodoList() {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return ListTile(
          title: Text(todo.title),
          subtitle: Text(todo.description),
          trailing: IconButton.filled(onPressed: removeTodo, icon: Icon(Icons.delete)),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Todo App'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                  hintText: 'Title ..',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  border:OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                  hintText: 'Description ..',
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: addTodo,
                child: Text('ADD'),
              ),
              SizedBox(height: 16),
              Expanded(child: _buildTodoList()),
            ],
          ),
        ),
      ),
    );
  }
}
