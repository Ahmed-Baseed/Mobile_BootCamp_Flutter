import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/features/view/signinPage.dart';
import 'package:mobile_bootcamp_flutter/day_73/providerExercise/currencyScreen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CurrencyScreen(),
                    ));
              },
              icon: Icon(Icons.heart_broken))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Favourited Currencies:"),
            smallSpace(),
            TextField(
              enabled: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 1))),
            )
          ],
        ),
      ),
    );
  }
}
