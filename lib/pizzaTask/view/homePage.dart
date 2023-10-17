import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/pizzaTask/model/pizzaClass.dart';

class PizzaOrder extends StatefulWidget {
  const PizzaOrder({super.key});

  @override
  State<PizzaOrder> createState() => _PizzaOrderState();
}

class _PizzaOrderState extends State<PizzaOrder> {
  PizzaSize? selectedSize;
  List<String> toppings = [
    'Pepperoni',
    'Sausage',
    'Garlic sauce',
  ];
  List<String> selectedToppings = [];
  bool isGlutenFree = false;
  bool specialInstructions = false;

  Widget radioButton(PizzaSize size, String label) {
    return Row(
      children: [
        Radio<PizzaSize>(
          value: size,
          groupValue: selectedSize,
          onChanged: (PizzaSize? value) {
            setState(() {
              selectedSize = value!;
            });
          },
        ),
        Text(label),
      ],
    );
  }

  Widget dropdownButton() {
    if (selectedSize == null) {
      return Container();
    }
    return Column(
      children: [
        Text(
          'Toppings',
        ),
        DropdownButton<String>(
          value: selectedTopping,
          items: [
            DropdownMenuItem<String>(
              value: null,
              child: Text('Choose One'),
            ),
            ...toppings.map((topping) {
              return DropdownMenuItem<String>(
                value: topping,
                child: Text(topping),
              );
            }),
          ],
          onChanged: (String? value) {
            setState(() {
              selectedTopping = value;
              if (selectedTopping != null) {
                selectedToppings.add(selectedTopping!);
                selectedTopping = null;
              }
            });
          },
        ),
        SizedBox(height: 20, child: Divider(thickness: 2)),
        SizedBox(height: 20),
        CheckboxListTile(
          title: Text('Gluten-free'),
          value: isGlutenFree,
          onChanged: (value) {
            setState(() {
              isGlutenFree = value!;
            });
          },
        ),
        CheckboxListTile(
          title: Text('Special Instructions'),
          value: specialInstructions,
          onChanged: (value) {
            setState(() {
              specialInstructions = value!;
            });
          },
        ),
        if (specialInstructions)
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
            ),
            child: TextField(
              maxLength: 100,
            ),
          ),
      ],
    );
  }

  String? selectedTopping;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pizza Order 😍",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'size',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                radioButton(PizzaSize.small, 'Small'),
                radioButton(PizzaSize.medium, 'Medium'),
                radioButton(PizzaSize.large, 'Large'),
              ],
            ),
            SizedBox(
              height: 20,
              child: Divider(thickness: 2),
            ),
            SizedBox(height: 20),
            dropdownButton(),
            if (selectedToppings.isNotEmpty)
              Column(
                children: [
                  SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: selectedToppings.length,
                    itemBuilder: (context, index) {
                      final topping = selectedToppings[index];
                      return ListTile(
                        title: Text(topping),
                        leading: IconButton(
                          icon: Icon(Icons.remove_circle_outline),
                          onPressed: () {
                            setState(() {
                              selectedToppings.removeAt(index);
                            });
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ElevatedButton(
              onPressed: selectedSize != null ? () {} : null,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add_shopping_cart_rounded),
                  SizedBox(width: 8),
                  Text('Confirm ❤️'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
