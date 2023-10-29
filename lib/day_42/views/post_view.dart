import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/day_42/controllers/post_controller.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  late PostController postController;
  @override
  void initState() {
    postController = PostController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: FutureBuilder(
          future: postController.loadAsset(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.separated(
                separatorBuilder: (context, index) => Divider(thickness: 0.5,),
                itemCount: postController.li.length,
                itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.only(left: 15,right: 15,top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.grey[400],
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child:
                                    Text("Post ${index+1}")),
                          )
                        ],
                      ),
                      Text("${postController.li[index].title}"),
                      Text("${postController.li[index].body}",style: TextStyle(color: Colors.grey),),
                    ],
                  ),
                ),
              );
              // Text('File content: ${snapshot.data}');
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
