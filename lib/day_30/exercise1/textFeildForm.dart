import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_bootcamp_flutter/day_30/exercise1/tableInfo.dart';

class TextFormExercise extends StatefulWidget {
  const TextFormExercise({Key? key}) : super(key: key);

  @override
  State<TextFormExercise> createState() => _TextFormExerciseState();
}

class _TextFormExerciseState extends State<TextFormExercise> {
  TextEditingController name = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController confirm = TextEditingController();
  GlobalKey<FormState> frmKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Form(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: name,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value.toString().length < 3)
                    return "Name cannot be less then 3";
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  hintText: "Enter Name",
                  label: Text("Name"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: mobile,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  hintText: "Mobile No.",
                  label: Text("Mobile"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: pass,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  hintText: "Password",
                  label: Text("Password"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: confirm,
                validator: (value) {
                  if (value != pass.text) return "Not Match";
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  hintText: "Confirm Password",
                  label: Text("Confirm Password"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        name.clear();
                        mobile.clear();
                        pass.clear();
                        confirm.clear();
                      },
                      child: Text("reset")),
                  ElevatedButton(
                      onPressed: () {
                        name.clear();
                      },
                      child: Text("clear name only")),
                ],
              ),
              FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TableInfo(),
                        ));
                  })
            ],
          )),
        ),
      ),
    );
  }
}
