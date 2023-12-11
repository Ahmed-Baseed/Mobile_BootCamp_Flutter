import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class HomeVM with ChangeNotifier {

  HomeVM(){
    loadProducts();
  }

  String title = 'no content';
  changeContent(String x){
    title = x;
    notifyListeners();
  }


  List<dynamic> _allProducts = [];
  List<dynamic> get allProduct=>_allProducts;

  int _number = 0;
  set number(int x){
    _number = x;
  }
  int get number => _number;

  loadProducts()async{
    Response res = await Dio().get('https://dummyjson.com/products');
    _allProducts = res.data['products'];
    notifyListeners();
  }

  addNewProduct(Map<String,dynamic> product){

    _allProducts.add(product);
    notifyListeners();

  }

}
