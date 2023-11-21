import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/hive_lecture/core/repostories/hive_product_repo.dart';
import 'package:mobile_bootcamp_flutter/hive_lecture/core/viewModel/product_viewModel.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  ProductVM pvm = ProductVM();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: pvm.fetchProductsFromRepo(HiveProductRepo(), 'products'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Image.network(snapshot.data![index].thumbnail!),
                        ListTile(
                          title: Text("${snapshot.data![index].title}"),
                        )
                      ],
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text("No Data Avaiable"),
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
