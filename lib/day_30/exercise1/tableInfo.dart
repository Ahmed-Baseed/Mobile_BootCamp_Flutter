import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/day_30/exercise1/model.dart';
import 'package:mobile_bootcamp_flutter/day_30/exercise1/textFeildForm.dart';

class TableInfo extends StatefulWidget {

  @override
  State<TableInfo> createState() => _TableInfoState();
}

class _TableInfoState extends State<TableInfo> {
  Data? data;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50,bottom: 50),
            child: Table(
              
              border: TableBorder.all(color: Colors.black,width: 1),
              
             children: [
             TableRow(children: [
               TableCell(child: Text("${data!.name}")),
               TableCell(child: Text("${data!.phone}")),
             ]),
             TableRow(children: [
               TableCell(child: Text("")),
               TableCell(child: Text("")),
             ]),
             TableRow(children: [
               TableCell(child: Text("")),
               TableCell(child: Text("")),
             ]),
             ],),
          ),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => TextFormExercise(),));
          }, child: Text("Back Home"))
        ],
      ),
    );
  }
}