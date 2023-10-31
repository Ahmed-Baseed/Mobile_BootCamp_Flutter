import 'package:dio/dio.dart';
import 'package:mobile_bootcamp_flutter/day_45/model/todoModel.dart';

class TodoController {
  Future<List<Todo>> loadTodo() async {
    Dio d = Dio();
    Response serverResponse = await d.get(
      "https://dummyjson.com/todos?limit=5",
    );
    List<Todo> todoList = (serverResponse.data["todos"] as List)
        .map((e) => Todo.fromJson(e))
        .toList();
    print(todoList);
    return todoList;
  }

  Future<bool> postTodo(Todo todo) async {
    Dio dd = Dio();
    todo.toJson();
    Response serverResponse = await dd.post(
      "https://dummyjson.com/todos/add",data: todo.toJson()
    );
    if(serverResponse.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }
}
