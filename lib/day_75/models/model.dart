// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  String? name;
  String? price;
  bool is_selected = false;
  Product({
    this.name,
    this.price,
    required this.is_selected,
  });
}
