import 'dart:async';

import 'package:floor/floor.dart';
import 'package:mobile_bootcamp_flutter/day56_lecture/DAO/deptDAO.dart';
import 'package:mobile_bootcamp_flutter/day56_lecture/DAO/stuDAO.dart';
import 'package:mobile_bootcamp_flutter/day56_lecture/model/dept.dart';
import 'package:mobile_bootcamp_flutter/day56_lecture/model/stu.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_db.g.dart';
@Database(version: 1, entities: [Student, Department])
abstract class App_db extends FloorDatabase {
  StudentDAO get studentDAO;
  DepartmentDAO get departmentDAO;
}
