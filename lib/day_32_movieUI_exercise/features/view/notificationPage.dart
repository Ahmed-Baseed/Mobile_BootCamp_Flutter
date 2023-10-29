import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/features/view/signinPage.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 37, 41, 1),
      appBar: AppBar(
        title: Text("NOTIFICATION"),
        backgroundColor: Color.fromRGBO(33, 37, 41, 1),
        iconTheme: IconThemeData(color: Colors.amberAccent),
        elevation: 10,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Today",
              style: TextStyle(color: Colors.white),
            ),
            smallSpace(),
            for (int a = 0; a < 3; a++)
              ListTile(
                titleAlignment: ListTileTitleAlignment.top,
                leading: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[800],
                  ),
                  height: 40,
                  width: 45,
                  child: Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.amber,
                  ),
                ),
                contentPadding: EdgeInsets.zero,
                title: Text(
                  "Singal up deep line",
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Contrary to popular belief, Lorem ipsum is not simply random text",
                      style: TextStyle(color: Colors.grey),
                    ),
                    mediamSpace(),
                    Text(
                      "11:50 am",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                trailing: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            Divider(
              color: Colors.grey,
              thickness: 0.3,
              endIndent: 15,
            )
          ],
        ),
      ),
    );
  }
}
