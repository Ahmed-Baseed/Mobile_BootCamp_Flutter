import 'package:mobile_bootcamp_flutter/hive_lecture/core/model/product22.dart';
import 'package:mobile_bootcamp_flutter/hive_lecture/core/repostories/product_repo.dart';
import 'package:mobile_bootcamp_flutter/hive_lecture/core/viewModel/product_viewModel.dart';
import 'package:mobile_bootcamp_flutter/hive_lecture/helper/hive_manager.dart';

class SplashVM {
  Future<bool> loadProduct(ProductRepo repo, String source,
      {String? boxName}) async {
    ProductVM pvm = ProductVM();
    List<Product2> products = await pvm.fetchProductsFromRepo(repo, source);
    return storeProduct(products, boxName ?? source);
  }

  bool storeProduct(List<Product2> products, String boxName) {
    HiveManager hiveManager = HiveManager(boxName);
    products.forEach((element) {
      hiveManager.store(element);
    });
    return true;
  }
}
