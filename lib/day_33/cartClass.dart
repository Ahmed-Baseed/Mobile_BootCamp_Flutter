import 'package:mobile_bootcamp_flutter/day_33/productClass.dart';

class Cart {
  final List<Product> _items = [];

  List<Product> get items => _items;

  void addToCart(Product product) {
    _items.add(product);
  }

  void removeFromCart(Product product) {
    _items.remove(product);
    product.isSelected = false;
  }

  void clearCart() {
    _items.clear();
  }
}