import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/themeProvider/theme_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Provider.of<ThemeProvider>(context,listen: false).toggleTheme();
          },
          child: Text('Change Theme'),
        ),
      ),
    );
  }
}
