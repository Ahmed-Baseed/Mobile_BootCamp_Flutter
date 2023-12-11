import 'dart:async';
import 'package:floor/floor.dart';
import 'package:task_manager/core/local_database/DAOs/assignTasksDao.dart';
import 'package:task_manager/core/local_database/DAOs/tasksDao.dart';
import 'package:task_manager/core/local_database/DAOs/usersDao.dart';
import 'package:task_manager/core/local_database/entities/assignTasks.dart';
import 'package:task_manager/core/local_database/entities/tasks.dart';
import 'package:task_manager/core/local_database/entities/users.dart';
import 'package:sqflite/sqflite.dart' as sqflite;


part 'appDatabase.g.dart';

@Database(version: 1, entities: [User, Task, AssignTask])
abstract class AppDatabase extends FloorDatabase {
  UserDAO get userDAO;
  TaskDAO get taskDAO;
  AssignTaskDAO get assignTaskDAO;
}
