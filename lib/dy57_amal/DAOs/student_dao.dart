import 'package:floor/floor.dart';
import 'package:mobile_bootcamp_flutter/dy57_amal/entites/student.dart';
@dao
abstract class StudentDao {
  @Query('SELECT * FROM StudentX')
  Future<List<Student>> getAllStudents();
  @Query('SELECT * FROM StudentX WHERE id = :id')
  Future<Student?> getOneStudent(int id);

  @insert
  Future<int> AddStudent(Student s);
  @insert
  Future<List<int>> AddStudentList(List<Student> s);
  @update
  Future<int> updateStudent(Student s);
  @update
  Future<int> updateStudentList(List<Student> s);

  @Query('DELETE FROM StudentX WHERE id = :id')
  Future<int?> deleteStudent(int id);
  @delete
  Future<int> deleteStudent2(Student s);
  @delete
  Future<int> deleteStudentList(List<Student> s);
  @Query('DELETE FROM StudentX')
  Future<int?> deletAllStudent();

  @Query('SELECT * FROM StudentX WHERE full_name LIKE :word')
  Future<List<Student>> searchByName(String word);
}