import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobile_bootcamp_flutter/api_mokhtar_part2/core/repositories/data_repo.dart';
import 'package:mobile_bootcamp_flutter/api_mokhtar_part2/helper/dion_connection.dart';

class OnlineDataRepo extends DataRepo {
  @override
  Future<Map<String, dynamic>> getData(
      {required String source, List<String>? columns}) async {
    try {
      Response<String> serverResponse =
          await DioConnection.connect().get(source);
      //Response<String> serverResponse=await Dio().get(source);

      Map<String, dynamic> content = jsonDecode(serverResponse.data!);
      // print(content);
      return content;
    } catch (ex) {
      return {};
    }
  }

  @override
  Future<Map<String, dynamic>> postData(
      Map<String, dynamic> dataToSend, String source) async {
    Response<String> serverResponse =
        await DioConnection.connect().post(source, data: dataToSend);

    if (serverResponse.statusCode == 201) {
      Map<String, dynamic> info = jsonDecode(serverResponse.data!);
      return info;
    } else {
      return {"id": -1};
    }
  }
}
