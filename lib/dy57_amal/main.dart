import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/dy57_amal/db_helper.dart';
import 'package:mobile_bootcamp_flutter/dy57_amal/entites/student.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDatabase();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () async {
          // int x = await DBHelper.database.studentDao.AddStudent(Student(name: 'Amal',
          //     email: 'aa@gma.com', departmentId: 1, phoneNo: '0564'));
          // print(x);

          int x = await DBHelper.database.studentDao.updateStudentList([
            Student(
                id: 2,
                name: 'Mohammed',
                email: 'mo@gma.com',
                departmentId: 2,
                phoneNo: '0544'),
            Student(
                id: 1,
                name: 'Hasan',
                email: 'ha@gma.com',
                departmentId: 3,
                phoneNo: '0534')
          ]);
          print(x);
          setState(() {});
        }),
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: FutureBuilder(
            future: DBHelper.database.studentDao.getAllStudents(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Student>> snapshot) {
              if (snapshot.hasData) {
                return snapshot.data!.isEmpty
                    ? Text('Empty')
                    : ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) {
                          return ListTile(
                            title: Text(snapshot.data![index].name!),
                            subtitle: Text(snapshot.data![index].email!),
                          );
                        });
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
