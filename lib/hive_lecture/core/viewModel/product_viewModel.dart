import 'package:mobile_bootcamp_flutter/hive_lecture/core/model/product22.dart';
import 'package:mobile_bootcamp_flutter/hive_lecture/core/repostories/product_repo.dart';

class ProductVM {
  List<Product2> allProducts = [];
  Future<List<Product2>> fetchProductsFromRepo(
      ProductRepo repo, String source) async {
    allProducts = await repo.getProduct(source);
    return allProducts;
  }
}
