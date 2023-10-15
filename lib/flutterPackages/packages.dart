import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Packages extends StatefulWidget {
  const Packages({super.key});

  @override
  State<Packages> createState() => _PackagesState();
}

class _PackagesState extends State<Packages> {
  String? imagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: imagePath != null?Image.file(File(imagePath!)):Container(
          child: Text("No Image Found"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          ImagePicker picker = ImagePicker();
          XFile? selectedImage =
              await picker.pickImage(source: ImageSource.camera);
          if(selectedImage != null)
            {
              imagePath = selectedImage.path;
            }
          setState(() {

          });
        },
        child: Icon(Icons.camera),
      ),
    );
  }
}
