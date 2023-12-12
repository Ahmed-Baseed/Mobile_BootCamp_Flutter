import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_bootcamp_flutter/getX_leacture/viewModels/home_viewModel.dart';

class SecondPagee extends StatelessWidget {
   SecondPagee({super.key});
  HomeVM hvm2 = Get.put(HomeVM());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("${hvm2.number}",style: TextStyle(fontSize: 50),),
      ),
    );
  }
}
