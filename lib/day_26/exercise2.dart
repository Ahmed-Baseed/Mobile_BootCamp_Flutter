import 'package:flutter/material.dart';

class AddWidgetsDynamically extends StatefulWidget {
  const AddWidgetsDynamically({super.key});

  @override
  State<AddWidgetsDynamically> createState() => _AddWidgetsDynamicallyState();
}

class _AddWidgetsDynamicallyState extends State<AddWidgetsDynamically> {
  List<Widget> generatedWidgets = [];

  void generateWidget() {
    setState(() {
      generatedWidgets.add(Text(
        "Text ${generatedWidgets.length + 1}",
        style: TextStyle(fontSize: 40),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "ADD Widgets Dynamically",
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: generatedWidgets.length,
              itemBuilder: (context, index) {
                return generatedWidgets[index];
              },
            ),
          ),
          ElevatedButton(
            onPressed: generateWidget,
            child: Text('ADD TEXT WIDGET'),
          ),
        ],
      ),
    );
  }
}
