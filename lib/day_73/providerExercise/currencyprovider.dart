import 'package:flutter/material.dart';

import 'Currency.dart';

class CurrencyProvider with ChangeNotifier {
  List<Currency> currency = [
    Currency(code: 'SAR', price: 350, isSelected: false, amount: 0),
    Currency(code: 'US', price: 1500, isSelected: false, amount: 0),
    Currency(code: 'EURO', price: 400, isSelected: false, amount: 0),
  ];
  List<Currency> allCurrencies = [];

  addCurrency(Currency c){
    allCurrencies.add(c);
    notifyListeners();
  }
  removeCurrency(Currency c){
    allCurrencies.remove(c);
    notifyListeners();
  }
  
}
