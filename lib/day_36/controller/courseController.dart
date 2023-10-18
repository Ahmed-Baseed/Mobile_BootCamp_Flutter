import 'package:mobile_bootcamp_flutter/day_36/model/courseClass.dart';

class CourseConroller {
  static List<Course> courses = [];


  void addCourse(String name, double hours) {
    Course course = Course(name: name,hours: hours);
    courses.add(course);
  }

  void deleteCourse(String name) {
    courses.removeWhere((course) => course.name == name);
  }
}