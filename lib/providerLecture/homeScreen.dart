import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/providerLecture/homeViewModel.dart';
import 'package:provider/provider.dart';

class MainHome extends StatelessWidget {
  const MainHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => HomeVM(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Badge(
                child: Icon(Icons.shopping_cart),
                label: Selector<HomeVM,int>(
                  selector: (context, value) => value.number,
                  builder: (context, value, child) {
                    return Text('$value');
                  },
                ),
              ),
            ),
          ],
        ),
        body: Consumer<HomeVM>(
          builder: (context, value, child) {
            return value.allProduct.length > 0
                ? ListView.builder(
                    itemCount: value.allProduct.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('${value.allProduct[index]['title']}'),
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
        // Column(
        //   children: [
        //     Consumer<HomeVM>(
        //       builder: (context, value, child) {
        //         return Text(value.title);
        //       },
        //     )
        //   ],
        // ),
        floatingActionButton: Consumer<HomeVM>(
          builder: (context, value, child) {
            return FloatingActionButton(
              onPressed: () {
                // value.addNewProduct("title":"New Product");
              },
              child: Icon(Icons.add),
            );
          },
        )
      ),
    );
  }
}
