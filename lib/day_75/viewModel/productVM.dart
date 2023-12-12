import 'package:get/get.dart';
import 'package:mobile_bootcamp_flutter/day_75/models/model.dart';

class ProductVM2 extends GetxController {
  List<Product> allProducts = List.generate(
      10,
      (index) =>
          Product(name: 'Product $index', price: '45', is_selected: false));
  List<Product> wishes = [];

  addWish(Product p) {
    wishes.add(p);
    update();
  }

  removeWish(Product p) {
    wishes.remove(p);
    update();
  }
}
