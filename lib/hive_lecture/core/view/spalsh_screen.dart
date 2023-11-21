import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/hive_lecture/constant/apiRoute.dart';
import 'package:mobile_bootcamp_flutter/hive_lecture/core/repostories/product_api_repo.dart';
import 'package:mobile_bootcamp_flutter/hive_lecture/core/view/home_screen.dart';
import 'package:mobile_bootcamp_flutter/hive_lecture/core/viewModel/spalsh_viewModel.dart';

class Spalsh_sreen extends StatefulWidget {
  const Spalsh_sreen({super.key});

  @override
  State<Spalsh_sreen> createState() => _Spalsh_sreenState();
}

class _Spalsh_sreenState extends State<Spalsh_sreen> {
  @override
  Widget build(BuildContext context) {
    loadData();
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
  Future<void>loadData()async{
    SplashVM svm =SplashVM();
    svm.loadProduct(ProductAPIRepo(), APIRout.PRODUCT_URL,boxName: 'products');
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home_Screen(),));
  }
}
