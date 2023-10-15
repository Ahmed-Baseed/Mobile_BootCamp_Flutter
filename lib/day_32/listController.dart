import 'package:mobile_bootcamp_flutter/day_32/listClass.dart';

class ListController {
  List<ListClass> _product = [];
}

List<ListClass> get _product => _product;

getData(String name, description, double price) {
  ListClass listClass = ListClass();

  listClass.name = name;
  listClass.description = description;
  listClass.price = price;

  _product.add(listClass);
}
