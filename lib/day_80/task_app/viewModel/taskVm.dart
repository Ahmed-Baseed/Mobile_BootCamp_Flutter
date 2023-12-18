import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/day_80/task_app/model/task_model.dart';
import 'package:flutter/material.dart';

class TaskVM extends ChangeNotifier {
  FirebaseFirestore tasksfirestore = FirebaseFirestore.instance;

  List<TaskModel> _tasks = [];

  List<TaskModel> get tasks => _tasks;

  void addTask(TaskModel task) {
    task.id = generateId();
    tasksfirestore.collection('tasks').add(task.toMap());
    notifyListeners();
  }

  Future<List<TaskModel>?> loadTasks() async {
    try{
    QuerySnapshot query = await tasksfirestore.collection('tasks').get();
    List<DocumentSnapshot> documents = query.docs;


    return documents
        .map((e) => TaskModel.fromMap(map: e.data() as Map<String, dynamic>,docId:e.id))
        .toList();
}catch(e){print(e);}
return null;
  }

  generateId() {
    return Random().nextInt(1000);
  }

  // void editTask(TaskModel taskModel) {
  //   _tasks.forEach(
  //     (element) {
  //       if (element.id == taskModel.id) {
  //         element.title = taskModel.title;
  //         element.description = taskModel.description;
  //       }
  //     },
  //   );
    // _tasks[index].title = title;
    // _tasks[index].description = description;
  //   notifyListeners();
  // }

  void removeTask(String id) {
    tasksfirestore.collection('tasks').doc(id).delete();
    notifyListeners();
  }

  // void taskStatus(TaskModel taskModel) {
  //   _tasks.
  //   notifyListeners();
  // }
}
