import 'package:mobile_bootcamp_flutter/day_37/model/courseModel.dart';

class SemesterModel {
  String? name;
  int? year;
  List<Course>? courses;

  SemesterModel({
    this.name,
    this.year,
    this.courses,
  });
}
