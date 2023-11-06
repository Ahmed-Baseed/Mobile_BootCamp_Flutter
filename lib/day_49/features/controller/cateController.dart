import 'package:dio/dio.dart';
import 'package:mobile_bootcamp_flutter/day_49/core/appURL.dart';

class CateController {
  Future<List<String>> getCateogru() async {
    Dio dio = Dio();
    Response response = await dio.get(API_url.BASE_URL);
    List<String>? list = (response.data as List).map<String>((e) => e).toList();
    return list;
  }
}
