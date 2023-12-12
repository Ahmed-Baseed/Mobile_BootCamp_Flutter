import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_bootcamp_flutter/getX_leacture/viewModels/home_viewModel.dart';
import 'package:mobile_bootcamp_flutter/getX_leacture/views/second_page.dart';

class HomePagee extends StatelessWidget {
   HomePagee({super.key});

   HomeVM hvm = Get.put(HomeVM());
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() => Center(
            child: Text('${hvm.number}',style: TextStyle(fontSize: 40),),
          )),
      // body: GetX<HomeVM>(
      //   init: HomeVM(),
      //   builder: (controller) {
      //     return Center(
      //       child: Text('${hvm.number} ${hvm.num}',style: TextStyle(fontSize: 40),),
      //     );
      //   },
      // ),
      floatingActionButton: GetBuilder<HomeVM>(
        builder: (controller) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(onPressed: (){
                controller.addNum();
              },child: Icon(Icons.add),),
              FloatingActionButton(onPressed: (){
                Get.to(SecondPagee());
              },child: Icon(Icons.remove),),
            ],
          );
        },
      ),
    );
  }
}
