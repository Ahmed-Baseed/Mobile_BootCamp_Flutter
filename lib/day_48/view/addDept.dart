// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:mobile_bootcamp_flutter/day_48/controller/DeptController.dart';
import 'package:mobile_bootcamp_flutter/day_48/model/DeptModel.dart';

// ignore: must_be_immutable
class AddDept extends StatefulWidget {
  DeptController deptController;
  AddDept({
    Key? key,
    required this.deptController,
  }) : super(key: key) {
    deptController = deptController;
  }

  @override
  State<AddDept> createState() => _AddDeptState();
}

class _AddDeptState extends State<AddDept> {
  bool checkValue = false;
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Department"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(hintText: "Name"),
            ),
            CheckboxListTile(
              title: Text("Active Department"),
              value: checkValue,
              onChanged: (value) {
                setState(() {
                  checkValue = value!;
                });
              },
            ),
            ElevatedButton(
                onPressed: () async {
                  Dept dept = Dept();
                  dept.name = textEditingController.text;
                  dept.active = checkValue;
                  bool b = await widget.deptController.postDepartment(dept);
                  Navigator.pop(context, b);
                },
                child: Text("Add"),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
                ))
          ],
        ),
      ),
    );
  }
}
