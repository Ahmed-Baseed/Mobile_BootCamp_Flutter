import 'package:floor/floor.dart';
import 'package:mobile_bootcamp_flutter/day56_lecture/model/stu.dart';

@dao
abstract class StudentDAO {
  @Query('SELECT * FROM StudentX')
  Future<List<Student>> getAllStu();
  @Query('SELECT * FROM StudentX WHERE id:student_id')
  Future<Student?> getOneStu(int student_id);
  @insert
  Future<int> addStu(Student s);
  @insert
  Future<List<int>> addStuList(List<Student> s);
  @update
  Future<int> updateStu(Student s);
  @update
  Future<int> updateStuList(List<Student> s);
  @Query('DELETE FROM StudentX WHERE id:id')
  Future<int?> deleteStu(int id);
  @delete
  Future<int> deleteStu2(Student s);
  @delete
  Future<int> deleteStuList(List<Student> s);
  @Query('DELETE FROM StudentX')
  Future<int?> deleteAllStu();
  @Query('SELECT * FROM StudentX WHERE full_name LIKE :word')
  Future<List<Student>> searchByName(String word);
}
