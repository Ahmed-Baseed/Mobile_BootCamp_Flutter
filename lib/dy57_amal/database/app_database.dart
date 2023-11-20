import 'dart:async';

import 'package:floor/floor.dart';
import 'package:mobile_bootcamp_flutter/dy57_amal/DAOs/department_dao.dart';
import 'package:mobile_bootcamp_flutter/dy57_amal/DAOs/student_dao.dart';
import 'package:mobile_bootcamp_flutter/dy57_amal/entites/department.dart';
import 'package:mobile_bootcamp_flutter/dy57_amal/entites/student.dart';


import 'package:sqflite/sqflite.dart' as sqflite;
part 'app_database.g.dart';

@Database(version: 1, entities: [Student, Department])
abstract class AppDatabase extends FloorDatabase {
  StudentDao get studentDao;
  DepartmentDao get departmentDao;
}