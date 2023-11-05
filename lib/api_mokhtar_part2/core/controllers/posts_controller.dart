
import 'package:mobile_bootcamp_flutter/api_mokhtar_part2/core/models/post.dart';
import 'package:mobile_bootcamp_flutter/api_mokhtar_part2/core/repositories/data_repo.dart';
import 'package:mobile_bootcamp_flutter/api_mokhtar_part2/utils/constants/api_routes.dart';

class PostsController{

  Future<Map<String,dynamic>>savePost(DataRepo repo,Post p)async{
   Map<String,dynamic>feedback=await repo.postData(p.toJson(),APIRoutes.STORE_POST);

   return feedback;

  }

}