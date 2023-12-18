import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/day_79/task_app/model/task_model.dart';

class TaskVM extends ChangeNotifier {
  List<TaskModel> _tasks = [];

  List<TaskModel> get tasks => _tasks;

  void addTask(TaskModel task) {
    task.id = generateId();
    _tasks.add(task);
    notifyListeners();
  }
  generateId(){
    return Random().nextInt(1000);
  }

  void editTask(TaskModel taskModel) {
    _tasks.forEach((element) {
      if(element.id == taskModel.id){
        element.title = taskModel.title;
        element.description = taskModel.description;
      }
    },);
    // _tasks[index].title = title;
    // _tasks[index].description = description;
    notifyListeners();
  }

  void removeTask(TaskModel task) {
    _tasks.remove(task);
    notifyListeners();
  }

  // void taskStatus(TaskModel taskModel) {
  //   _tasks.
  //   notifyListeners();
  // }

}
