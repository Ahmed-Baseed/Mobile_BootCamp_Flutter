import 'package:floor/floor.dart';

import 'package:mobile_bootcamp_flutter/day56_lecture/model/dept.dart';

@Entity(tableName: 'StudentX', foreignKeys: [
  ForeignKey(
      childColumns: ['deptID'], parentColumns: ['id'], entity: Department)
], indices: [
  Index(value: ['phone_no', 'email'], unique: false)
])
class Student {
  @primaryKey
  final int? id;
  @ColumnInfo(name: 'full_name')
  final String name;
  @ColumnInfo(name: 'phone_no')
  final String? phoneNo;
  final String? email;
  final bool? active;
  final int? deptID;

  @ignore
  final bool? isSelected;
  Student({
    this.id,
    required this.name,
    this.phoneNo,
    this.email,
    this.active,
    this.deptID,
    this.isSelected,
  });
}
