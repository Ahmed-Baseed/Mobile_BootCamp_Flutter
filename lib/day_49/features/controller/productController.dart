import 'package:dio/dio.dart';
import 'package:mobile_bootcamp_flutter/day_49/core/appURL.dart';
import 'package:mobile_bootcamp_flutter/day_49/features/model/productModel.dart';

class ProductController {
  Future<List<Product>> getProduct(String s) async {
    Dio dio = Dio();
    Response serverResponse = await dio.get('${API_url.CATE}/$s');
    List<Product>? products =
        (serverResponse.data as List).map((e) => Product.fromJson(e)).toList();
    return products;
  }
}
