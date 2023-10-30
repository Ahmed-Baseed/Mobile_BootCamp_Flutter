import 'package:dio/dio.dart';
import 'package:mobile_bootcamp_flutter/day_44/postModel.dart';

class PostController {
  Future<List<Data>> loadPost() async {
    Dio d = Dio();
    Response serverResponse = await d.get(
        "https://dummyapi.io/data/v1/post?limit=10",
        options: Options(headers: {"app-id": "653f8ed3cb3b4a43b8601849"}));
    List<Data> li = (serverResponse.data["data"] as List)
        .map((e) => Data.fromJson(e))
        .toList();
        print(li);
    return li;
  }
}
