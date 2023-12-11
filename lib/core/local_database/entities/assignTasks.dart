// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:floor/floor.dart';
import 'package:mobile_bootcamp_flutter/core/local_database/entities/tasks.dart';
import 'package:mobile_bootcamp_flutter/core/local_database/entities/users.dart';


@Entity(tableName: 'assignTasks',foreignKeys: [
  ForeignKey(childColumns: ['userId'], parentColumns: ['id'], entity: User),
  ForeignKey(childColumns: ['taskId'], parentColumns: ['id'], entity: Task)
])
class AssignTask {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final int? userId;
  final int? taskId;

  AssignTask({
    this.id,
    this.userId,
    this.taskId,
  });
}
