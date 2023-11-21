
import 'package:floor/floor.dart';
import 'package:mobile_bootcamp_flutter/dy57_amal/entites/department.dart';

// @entity
@Entity(tableName: 'StudentX', foreignKeys: [
  ForeignKey(
      childColumns: ['departmentId'],
      parentColumns: ['id'],
      entity: Department
  ),
], indices: [
  Index(value: ['phone_no','email'], unique: false)
])
class Student {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  @ColumnInfo(name: 'full_name')
  final String? name;
  @ColumnInfo(name: 'phone_no')
  final String? phoneNo;
  final String? email;
   bool? active;

  final int? departmentId;
  @ignore
  final bool isSelected;

  Student({this.id, this.name, this.phoneNo,
    this.departmentId, this.email,
    this.active, this.isSelected = false});
}