import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/features/view/signinPage.dart';
import 'package:mobile_bootcamp_flutter/day_55/view/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowInfo extends StatefulWidget {
  const ShowInfo({super.key});

  @override
  State<ShowInfo> createState() => _ShowInfoState();
}

class _ShowInfoState extends State<ShowInfo> {
   Color? color;
  late SharedPreferences sharedPreferences;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Settings(),
                    ));
              },
              icon: Icon(Icons.settings))
        ],
      ),
      body: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (BuildContext context, snapshot) {
         if(snapshot.hasData){
            return Container(
            padding: EdgeInsets.only(top: 40),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Text('${snapshot.data!.getString("n")}'),
                mediamSpace(),
                Text('${snapshot.data!.getString("e")}'),
                mediamSpace(),
                Container(
                  decoration: BoxDecoration(
                    
                  ),
                  height: 20,
                  width: 20,
                )
              ],
            ),
          );
         }else{
           return Center(child: Text("No Data Available"),);
         }
        },
      ),
    );
  }
}
