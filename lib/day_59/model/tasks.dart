// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
part 'tasks.g.dart';
@HiveType(typeId: 1)
class Tasks {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? description;
  @HiveField(2)
  bool? isDone;
  Tasks({
    this.title,
    this.description,
    this.isDone,
  });
}
