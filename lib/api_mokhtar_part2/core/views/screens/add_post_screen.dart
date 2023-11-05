
import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/api_mokhtar_part2/core/controllers/posts_controller.dart';
import 'package:mobile_bootcamp_flutter/api_mokhtar_part2/core/models/post.dart';
import 'package:mobile_bootcamp_flutter/api_mokhtar_part2/core/repositories/online_data.dart';

class AddNewPostScreen extends StatefulWidget {
  const AddNewPostScreen({Key? key}) : super(key: key);

  @override
  State<AddNewPostScreen> createState() => _AddNewPostScreenState();
}

class _AddNewPostScreenState extends State<AddNewPostScreen> {

  GlobalKey<FormState>frmKey=GlobalKey();
  TextEditingController titleController=TextEditingController();
  TextEditingController bodyController=TextEditingController();
  PostsController postsController=PostsController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        child: Column(children: [
          TextFormField(
            controller: titleController,
          ),
          TextFormField(
            controller: bodyController,
          ),
        ],),
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()async{
        Post p=Post(title: titleController.text,body: bodyController.text);
        Map<String,dynamic> data=await postsController.savePost(OnlineDataRepo(), p);
        String message="";
        if(data["id"]==-1)
          message="فشلت عملية الاضافة";
        else message="تمت الاضافة بنجاح";

        showDialog(context: context, builder: (ctx){
          return AlertDialog(title: Text("الحالة"),content: Text(message),);
        });

      },child: Icon(Icons.add),),
    );
  }
}
