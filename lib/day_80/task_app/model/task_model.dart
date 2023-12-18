import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TaskModel {
  int? id;
  String? docId;
  String? title;
  String? description;
  Status? status;

  TaskModel({
    this.id,
    this.docId,
    this.title,
    this.description,
    this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'status': status!.value,
    };
  }

  factory TaskModel.fromMap({required Map<String, dynamic> map, required String docId}) {
    return TaskModel(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      status: Status.values.firstWhere((element) => element.value==map['status']),
      docId:docId,
    );
  }
}



enum Status {
  notStarted("notStarted"),
  inProgress("inPrograss"),
  done("Done");

  const Status(this.value);
  final String value;
}
