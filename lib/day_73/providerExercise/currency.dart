// ignore_for_file: public_member_api_docs, sort_constructors_first
class Currency {
  String code;
  double price;
  bool isSelected;
  double amount = 0;

  Currency({
    required this.code,
    required this.price,
    required this.isSelected,
    required this.amount,
  });
}
