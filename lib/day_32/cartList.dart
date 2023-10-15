import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/day_32/cartClass.dart';

class CartScreen extends StatefulWidget {
  final Cart cart;

  const CartScreen({required this.cart});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double calculateTotalAmount() {
    double total = 0;
    for (var product in widget.cart.items) {
      total += product.price;
    }
    return total;
  }

  void clearCart() {
    setState(() {
      widget.cart.clearCart();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: widget.cart.items.length,
        itemBuilder: (context, index) {
          final product = widget.cart.items[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
            trailing: InkWell(
                child: Icon(
                  Icons.remove_circle,
                  color: Colors.red,
                ),
                onTap: () {
                  widget.cart.removeFromCart(product);
                  setState(() {});
                }),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Total Amount: \$${calculateTotalAmount().toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white)),
              onPressed: () {
                clearCart();
              },
              child: Text(
                'Clear Cart',
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white)),
              onPressed: () {},
              child: Text(
                'Confirm',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
