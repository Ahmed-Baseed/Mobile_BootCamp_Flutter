import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_bootcamp_flutter/themeProvider/pageHome.dart';
import 'package:mobile_bootcamp_flutter/themeProvider/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async{
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeProvider.currentTheme,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
