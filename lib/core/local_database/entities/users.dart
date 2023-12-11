import 'package:floor/floor.dart';

@Entity(tableName: 'users')
class User {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String? name;

  User({
    this.id,
    this.name,
  });
}
