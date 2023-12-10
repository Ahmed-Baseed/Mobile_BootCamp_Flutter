import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/day_73/providerExercise/currencyprovider.dart';
import 'package:mobile_bootcamp_flutter/day_73/providerExercise/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrencyProvider(),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MainScreen()
          );
      },
    );
  }
}
