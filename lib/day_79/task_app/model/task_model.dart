// ignore_for_file: public_member_api_docs, sort_constructors_first
class TaskModel {
  int? id;
  String title;
  String description;
  Status status;

  TaskModel(
   { this.id,
    required this.title,
    required this.description,
    required this.status,}
  );
}

enum Status {
  notStarted("notStarted"),
  inProgress("inPrograss"),
  done("Done");

  const Status(this.value);
  final String value;
}
