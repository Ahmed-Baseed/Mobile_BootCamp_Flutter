import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/core/local_database/db_helper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Random rand = Random();
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: DBHelper.database.userDAO.getAllUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Color.fromARGB(
                        rand.nextInt(256),
                        rand.nextInt(256),
                        rand.nextInt(256),
                        rand.nextInt(256)
                    ),
                    child: Text("${snapshot.data![index].name}"),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
