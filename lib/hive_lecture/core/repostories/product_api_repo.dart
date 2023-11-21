import 'package:dio/dio.dart';
import 'package:mobile_bootcamp_flutter/hive_lecture/core/model/product22.dart';
import 'package:mobile_bootcamp_flutter/hive_lecture/core/repostories/product_repo.dart';

class ProductAPIRepo extends ProductRepo {
  Dio d = Dio();

  @override
  Future<List<Product2>> getProduct(String source) async {
    Response server = await d.get(source);
    return await toListOfProduct(server.data['products']);
  }

  @override
  storeProduct() {
    // TODO: implement storeProduct
    throw UnimplementedError();
  }

  @override
  toListOfProduct(data) {
    return data.map((e) => Product2.fromJson(e)).toList();
  }
}
