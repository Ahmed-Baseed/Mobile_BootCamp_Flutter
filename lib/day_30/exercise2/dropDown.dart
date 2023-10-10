import 'package:flutter/material.dart';

class FormValdite extends StatefulWidget {
  const FormValdite({Key? key}) : super(key: key);

  @override
  State<FormValdite> createState() => _FormValditeState();
}

class _FormValditeState extends State<FormValdite> {
  String selectedCountry = "mvc";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Form(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                      value: selectedCountry,
                      items: [
                        DropdownMenuItem(value: 'ai', child: Text("AI")),
                        DropdownMenuItem(value: 'mvc', child: Text("MVC")),
                        DropdownMenuItem(value: 'vp', child: Text("VP")),
                      ],
                      onChanged: (x) {
                        selectedCountry = x!;
                        setState(() {});
                      }),
                  ElevatedButton(onPressed: () {}, child: Text("Get INFO"))
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}
