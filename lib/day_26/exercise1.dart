import 'package:flutter/material.dart';

class CurrencyConvert extends StatefulWidget {
  const CurrencyConvert({super.key});

  @override
  State<CurrencyConvert> createState() => _CurrencyConvertState();
}

class _CurrencyConvertState extends State<CurrencyConvert> {
  TextEditingController input = TextEditingController();
  int? selectedGender;
  var result;
  int? currency = 380;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(30),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: input,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                        value: 1,
                        groupValue: selectedGender,
                        onChanged: (v) {
                          selectedGender = v!;
                          result = int.parse(input.text) * currency!;

                          setState(() {});
                        }),
                    const Text("YEMENI RIYAL"),
                    Radio(
                        value: 2,
                        groupValue: selectedGender,
                        onChanged: (v) {
                          selectedGender = v!;
                          result = int.parse(input.text) / currency!;
                          setState(() {});
                        }),
                    const Text("SAUDI RIYAL"),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("$result")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
