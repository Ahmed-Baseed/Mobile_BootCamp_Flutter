import 'package:mobile_bootcamp_flutter/day56_lecture/DAO/database/app_db.dart';

class DBHelper{
  static late App_db database;

  static initDatabase()async{
    database = await $FloorApp_db.databaseBuilder('bootCamp_database.db').build();
  }
}