import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/day_33/cartClass.dart';
import 'package:mobile_bootcamp_flutter/day_33/cartList.dart';
import 'package:mobile_bootcamp_flutter/day_33/productClass.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Cart cart = Cart();
  final List<Product> productList = [
    Product(
        name: 'Product 1', description: "product 1 description", price: 10.0),
    Product(
        name: 'Product 2', description: "product 2 description", price: 20.0),
    Product(
        name: 'Product 3', description: "product 3 description", price: 30.0),
    Product(
        name: 'Product 4', description: "product 4 description", price: 30.0),
    Product(
        name: 'Product 5', description: "product 5 description", price: 30.0),
    Product(
        name: 'Product 6', description: "product 6 description", price: 30.0),
  ];

  void addToCart(Product product) {
    setState(() {
      product.isSelected != product.isSelected;
      if (product.isSelected) {
        cart.addToCart(product);
      } else {
        cart.removeFromCart(product);
      }
    });
  }

  void clearCart() {
    setState(() {
      cart.items.forEach((product) => product.isSelected = false);
      cart.clearCart();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Product List',style: TextStyle(color: Colors.black),),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert,color: Colors.black,),
            offset: Offset(0, 40),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('View Cart'),
                onTap: () async {
                bool result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CartScreen(cart: cart)),
                  );
                  if(result)
                  {
                    setState(() {
                      
                    });
                  }
                },
              ),
              PopupMenuItem(
                child: Text('Clear Cart'),
                onTap: () {
                  clearCart();
                },
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          final product = productList[index];
          return ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name),
                Text(product.description),
              ],
            ),
            subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
            trailing: Checkbox(
              value: product.isSelected,
              onChanged: (value) {
                setState(() {
                  product.isSelected = value!;
                  addToCart(product);
                });
              },
            ),
          );
        },
      ),
    );
  }
}