import 'package:dio/dio.dart';
import 'package:mobile_bootcamp_flutter/day_48/model/DeptModel.dart';

class DeptController {
  Future<List<Dept>> getDepartment() async {
    Dio d = Dio();
    Response serverResponse = await d
        .get("https://654679c2fe036a2fa955bee7.mockapi.io/api/v1/departments");
    List<Dept>? deptList =
        (serverResponse.data as List).map((e) => Dept.fromJson(e)).toList();
    print(serverResponse);
    return deptList;
  }

  Future<bool> postDepartment(Dept dept) async {
    Dio dd = Dio();
    print(dept.name);
    Response serverResponse = await dd.post(
        "https://654679c2fe036a2fa955bee7.mockapi.io/api/v1/departments",
        data: dept.toJson());
    if (serverResponse.statusCode == 201) {
      print(serverResponse.data);
      return true;
    } else {
      return false;
    }
  }

  // Future<bool> deleteDepartment(Dept dept)async{
  //   Dio ddd = Dio();
  //   Response serverResponse = await ddd.delete("https://654679c2fe036a2fa955bee7.mockapi.io/api/v1/departments/${dept.id}");
  // }
}
