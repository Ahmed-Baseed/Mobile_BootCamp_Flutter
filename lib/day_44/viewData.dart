import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/features/view/signinPage.dart';
import 'package:mobile_bootcamp_flutter/day_44/postController.dart';

class DataView extends StatefulWidget {
  const DataView({super.key});

  @override
  State<DataView> createState() => _DataViewState();
}

class _DataViewState extends State<DataView> {
  late PostController postController;
  @override
  void initState() {
    postController = PostController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: postController.loadPost(),
        builder: (context, snapshot) {
          print('jkhkj');
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => Card(
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            "${snapshot.data![index].owner!.picture}"),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "${snapshot.data![index].owner!.title}. ${snapshot.data![index].owner!.firstName} ${snapshot.data![index].owner!.lastName}"),
                                        Text(
                                            "${snapshot.data![index].publishDate}"),
                                      ],
                                    )
                                  ],
                                ),
                                smallSpace(),
                                Container(
                                    padding: EdgeInsets.all(10),
                                    height: 300,
                                    width: 250,
                                    child: Image.network(
                                      "${snapshot.data![index].image}",
                                      fit: BoxFit.cover,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ));
            } else {
              return Center(child: Text("No Data Available"));
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
