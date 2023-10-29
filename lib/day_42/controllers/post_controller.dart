import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mobile_bootcamp_flutter/day_42/models/post_model.dart';

class PostController {
  late List<PostModel> li;
  loadAsset() async {
    String content = await rootBundle.loadString('assets/images/post.json');
    li = (jsonDecode(content) as List)
        .map((e) => PostModel.fromJson(e))
        .toList();
    return li;
  }
}
