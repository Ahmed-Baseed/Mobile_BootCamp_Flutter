import 'package:floor/floor.dart';
import 'package:mobile_bootcamp_flutter/core/local_database/entities/assignTasks.dart';

@dao
abstract class AssignTaskDAO{
  @Query('SELECT * FROM assignTasks WHERE taskId = :taskId')
  Future<List<AssignTask>> getAssignTasksForTask(int taskId);
  @Query('SELECT * FROM assignTasks')
  Future<List<AssignTask>> getAllAssignTasksForTask();

  @insert
  Future<void> assignTask(AssignTask assignTask);
}