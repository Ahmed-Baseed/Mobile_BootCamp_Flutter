import 'package:floor/floor.dart';

@Entity(tableName: 'tasks')
class Task {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String? title;
  final String? description;
  final int? isCompleted;
  final String? startDate;
  final String? endDate;

  Task({
    this.id,
    this.title,
    this.description,
    this.isCompleted,
    this.startDate,
    this.endDate,
  });
}
