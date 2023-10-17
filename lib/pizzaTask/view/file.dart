// List<String> availableToppings = [
//   'Pepperoni',
//   'Mushrooms',
//   'Onions',
//   'Green peppers',
// ];
// String? selectedTopping;

// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text('Pizza Order'),
//     ),
//     body: Column(
//       children: [
//         SizedBox(height: 20),
//         Text(
//           'Select size:',
//           style: TextStyle(fontSize: 18),
//         ),
//         SizedBox(height: 10),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             buildSizeRadioButton(PizzaSize.small, 'Small'),
//             buildSizeRadioButton(PizzaSize.medium, 'Medium'),
//             buildSizeRadioButton(PizzaSize.large, 'Large'),
//           ],
//         ),
//         SizedBox(height: 20),
//         Text(
//           'Select topping:',
//           style: TextStyle(fontSize: 18),
//         ),
//         buildToppingDropdownButton(),
//         SizedBox(height: 20),
//         if (selectedTopping != null)
//           Text(
//             'Selected topping: $selectedTopping',
//             style: TextStyle(fontSize: 18),
//           ),
//       ],
//     ),
//   );
// }

// Widget buildToppingDropdownButton() {
//   return DropdownButton<String>(
//     value: selectedTopping,
//     hint: Text('Select topping'),
//     items: availableToppings.map((topping) {
//       return DropdownMenuItem<String>(
//         value: topping,
//         child: Text(topping),
//       );
//     }).toList(),
//     onChanged: (String? value) {
//       setState(() {
//         selectedTopping = value;
//       });
//     },
//   );
// }