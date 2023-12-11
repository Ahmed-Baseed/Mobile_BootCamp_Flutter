import 'package:floor/floor.dart';
import 'package:mobile_bootcamp_flutter/core/local_database/database/appDatabase.dart';

class DBHelper {
  static late AppDatabase database;

  static initDatabase() async {
    Callback callback = Callback(onCreate: (db, _) {
      List<String> user = [
        'Ahmed Mohammed',
        'Ali Khaled',
        'Salem Saeed',
        'Abdullah Ahmed'
      ];
      String result = List.generate(
          user.length, (index) => '(${index + 1}, "${user[index]}")').join(',');
      db.execute('INSERT INTO users VALUES $result');
    });
    database = await $FloorAppDatabase
        .databaseBuilder('AppTaskDB.db')
        .addCallback(callback)
        .build();
    print(database.runtimeType);
  }
}
