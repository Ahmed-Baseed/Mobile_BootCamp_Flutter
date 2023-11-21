import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  GetStorage box = GetStorage();
  bool isDark = true;
  bool isArabic = true;
  @override
  void initState() {
    isArabic = box.read("Arabic");
    isDark = box.read("Dark");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: box.read("Arabic")?TextDirection.rtl:TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Column(
            children: [
              SwitchListTile(
                  title: Text("Language"),
                  value: isArabic,
                  onChanged: (ctx) {
                    isArabic = ctx;
                    box.write('Arabic', ctx);
                    setState(() {});
                  }),
              SwitchListTile(
                  title: Text("App Theme"),
                  value: isDark,
                  onChanged: (ctx) {
                    isDark = ctx;
                    box.write('Dark', ctx);
                    setState(() {});
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
