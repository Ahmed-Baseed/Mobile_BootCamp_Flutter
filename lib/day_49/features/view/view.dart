import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/day_49/features/controller/cateController.dart';
import 'package:mobile_bootcamp_flutter/day_49/features/controller/productController.dart';
import 'package:mobile_bootcamp_flutter/day_49/features/view/product.dart';

class ViewProduct extends StatefulWidget {
  const ViewProduct({super.key});

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  // ProductController productController = ProductController();
  CateController cateController =CateController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: cateController.getCateogru(),
        builder: ( context,  snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasData){
              return ListView.builder(itemCount: snapshot.data!.length,itemBuilder: (context, index) {
                return Card(
                  
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Product(productCate: snapshot.data![index]),));
                    },
                    child: Row(
                      children: [
                        Text("${snapshot.data![index]}")
                      ],
                    ),
                  ),
                );
                
              },);

            }else{
              return Center(child: Text("No Data Available"),);
            }
          }else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}
