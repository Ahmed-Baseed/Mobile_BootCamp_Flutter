// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  TextEditingController controller;
  String text;
  bool isfalse;
  Textfield({
    Key? key,
    required this.controller,
    required this.text,
    required this.isfalse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: controller,
        obscureText: isfalse,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            fillColor: Colors.grey.shade100,
            filled: true,
            hintText: text,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}
