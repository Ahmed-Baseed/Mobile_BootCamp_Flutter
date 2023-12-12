import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/features/view/signinPage.dart';
import 'package:mobile_bootcamp_flutter/day_75/viewModel/productVM.dart';

class PageHome extends StatelessWidget {
  PageHome({super.key});
  ProductVM2 hvm = Get.put(ProductVM2());

  @override
  Widget build(BuildContext context) {
    Color white = Colors.white;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('GetX'),
        ),
        body: GetBuilder<ProductVM2>(
          builder: (controller) {
            return Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 300,
                      color: const Color.fromARGB(255, 160, 34, 34),
                      child: Center(
                        child: Text(
                          'Wish List: ${hvm.wishes.length}',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                    ),
                    mediamSpace(),
                    SizedBox(
                      height: 500,
                      child: ListView.builder(
                        itemCount: hvm.allProducts.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.amber,
                            child: ListTile(
                                title: Text('${hvm.allProducts[index].name}'),
                                trailing: GetBuilder<ProductVM2>(
                                  builder: (controller) {
                                    return IconButton(
                                        onPressed: () {
                                          if (hvm.allProducts[index]
                                                  .is_selected ==
                                              false) {
                                            hvm.addWish(hvm.allProducts[index]);
                                            hvm.allProducts[index].is_selected =
                                                true;
                                          } else {
                                            hvm.removeWish(
                                                hvm.allProducts[index]);
                                            hvm.allProducts[index].is_selected =
                                                false;
                                          }
                                        },
                                        icon: Icon(
                                          Icons.favorite,
                                          color: hvm.allProducts[index].is_selected==false?white:Colors.red,
                                        ));
                                  },
                                )),
                          );
                        },
                      ),
                    )
                  ]),
            );
          },
        ));
  }
}
