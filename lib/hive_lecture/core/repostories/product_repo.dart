import 'package:mobile_bootcamp_flutter/hive_lecture/core/model/product22.dart';

abstract class ProductRepo {
  Future<List<Product2>> getProduct(String source);
  storeProduct();
  List<Product2> toListOfProduct(dynamic data);
}
