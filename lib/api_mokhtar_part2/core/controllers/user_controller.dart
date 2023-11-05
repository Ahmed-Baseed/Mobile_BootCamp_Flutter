import 'package:mobile_bootcamp_flutter/api_mokhtar_part2/core/models/user.dart';
import 'package:mobile_bootcamp_flutter/api_mokhtar_part2/core/repositories/data_repo.dart';

class UserController {
  Future<List<User>> loadUsers(DataRepo repo, String source) async {
    Map<String, dynamic> data = await repo.getData(source: source);
    List<dynamic> users = data["users"];
    List<User> allUsers = users.map((e) => User.fromJson(e)).toList();
    return allUsers;
  }
}
