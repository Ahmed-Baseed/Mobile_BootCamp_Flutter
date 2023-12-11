import 'package:floor/floor.dart';
import 'package:mobile_bootcamp_flutter/core/local_database/entities/users.dart';

@dao
abstract class UserDAO {
  @Query('SELECT * FROM users')
  Future<List<User>> getAllUsers();

  @insert
  Future<void> insertUser(User user);

  @Query('SELECT * FROM users WHERE id = :userId')
  Future<User?> getUserById(int userId);
}
