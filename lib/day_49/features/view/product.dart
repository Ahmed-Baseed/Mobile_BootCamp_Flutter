// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:mobile_bootcamp_flutter/day_49/features/controller/productController.dart';

class Product extends StatefulWidget {
  String productCate;
  Product({
    Key? key,
    required this.productCate,
  }) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  ProductController productController = ProductController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: productController.getProduct(widget.productCate),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Row(
                      children: [Text("${snapshot.data![index].title}")],
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text("No Data Available"),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
