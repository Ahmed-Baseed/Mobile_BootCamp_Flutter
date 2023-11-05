import 'package:mobile_bootcamp_flutter/api_mokhtar_part2/core/models/product.dart';
import 'package:mobile_bootcamp_flutter/api_mokhtar_part2/core/repositories/data_repo.dart';

class ProductController {
  Future<List<Product>> loadProduct(DataRepo repo, String source) async {
    //print(source);
    Map<String, dynamic> data = await repo.getData(source: source);
    List<dynamic> products = data["products"];

    List<Product> allProducts =
        products.map((e) => Product.fromJson(e)).toList();
    print("mokhtar $allProducts");
    return allProducts;
  }
}
