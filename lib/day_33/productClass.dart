class Product {
  final String name, description;
  final double price;
  bool isSelected;

  Product(
      {required this.name,
      required this.price,
      required this.description,
      this.isSelected = false});
}
