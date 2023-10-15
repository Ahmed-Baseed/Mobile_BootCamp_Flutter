import 'package:flutter/material.dart';

class DesignUI extends StatefulWidget {
  const DesignUI({super.key});

  @override
  State<DesignUI> createState() => _DesignUIState();
}

class _DesignUIState extends State<DesignUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List Widget",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          PopupMenuButton<int>(
            icon: Icon(Icons.more_vert,color: Colors.black,),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: [Text("View Cart")],
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Row(
                  children: [Text("Cart Clear")],
                ),
              ),
            ],
            offset: Offset(0, 50),
            elevation: 2,
          ),
        ],
      ),
    );
  }
}
