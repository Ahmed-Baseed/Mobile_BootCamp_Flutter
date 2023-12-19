import 'package:dio/dio.dart';
import 'package:mobile_bootcamp_flutter/day_81/post_exercise/core/constant/api_route.dart';
import 'package:mobile_bootcamp_flutter/day_81/post_exercise/core/model/post.dart';

class PostVM {
  // Future<List<PostModel>?> getPosts() async {
  //   try {
  //     Dio dio = Dio();
  //     Response response = await dio.get(API_url.SHOW_POSTS);
  //     List<PostModel> list =
  //         (response.data as List).map((e) => PostModel.fromJson(e)).toList();
  //     return list;
  //   } catch (e) {
  //     print(e);
  //   }
  //   return null;
  // }
  Future<List<PostModel>?> getPosts() async {
    try {
    Dio dio = Dio();
    Response serverResponse = await dio.get('${API_url.BASE_URL}');
    List<PostModel>? posts =
        (serverResponse.data as List).map((e) => PostModel.fromJson(e)).toList();
    return posts;
      
    } catch (e) {
      print(e);
    }
    return null;
  }
}
