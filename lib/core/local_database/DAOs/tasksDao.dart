import 'package:floor/floor.dart';
import 'package:mobile_bootcamp_flutter/core/local_database/entities/tasks.dart';

@dao
abstract class TaskDAO {
  @Query('SELECT * FROM tasks')
  Future<List<Task>> getAllTasks();

  @insert
  Future<void> insertTask(Task task);
}
