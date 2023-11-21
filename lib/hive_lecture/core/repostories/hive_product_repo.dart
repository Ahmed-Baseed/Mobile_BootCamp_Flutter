import 'package:mobile_bootcamp_flutter/hive_lecture/core/model/product22.dart';
import 'package:mobile_bootcamp_flutter/hive_lecture/core/repostories/product_repo.dart';
import 'package:mobile_bootcamp_flutter/hive_lecture/helper/hive_manager.dart';

class HiveProductRepo extends ProductRepo {
  @override
  Future<List<Product2>> getProduct(String source) async{
    HiveManager hiveManager = HiveManager(source);
    return toListOfProduct(hiveManager.fetch());
    // return hiveManager.fetch() as List<Product2>;
  }

  @override
  storeProduct() {
    // TODO: implement storeProduct
    throw UnimplementedError();
  }
  
  @override
  List<Product2> toListOfProduct(data) {
    Iterable<dynamic> d = data;
    return d.map<Product2>((e) => e).toList();
  }

  
}
