import 'package:floor/floor.dart';
import 'package:mobile_bootcamp_flutter/day56_lecture/model/dept.dart';

@dao
abstract class DepartmentDAO {
  @Query('SELECT * FROM Department')
  Future<List<Department>> getAllDept();
  @Query('SELECT * FROM Department WHERE id :dept_id')
  Future<Department?> getOneDept(int dept_id);
  @insert
  Future<int> addDept(Department s);
  @insert
  Future<List<int>> addDeptList(List<Department> s);
  @update
  Future<int> updateDept(Department s);
  @update
  Future<int> updateDeptList(List<Department> s);
  @Query('DELETE FROM Department WHERE id :id')
  Future<int?> deleteDept(int id);
  @delete
  Future<int> deleteDept2(Department s);
  @delete
  Future<int> deleteDeptList(List<Department> s);
  @Query('DELETE FROM Department')
  Future<int?> deleteAllDept();
  @Query('SELECT * FROM Department WHERE full_name LIKE :word')
  Future<List<Department>> searchByName(String word);
}
