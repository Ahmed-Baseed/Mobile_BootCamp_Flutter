// import 'package:flutter/material.dart';

// class Bottmsheet extends StatelessWidget {
//   const Bottmsheet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(20),
//       height: MediaQuery.of(context).size.height * 0.75,
//       color: Colors.blueGrey,
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Textfield(controller: title, text: 'Title', isfalse: false),
//             Textfield(
//                 controller: description, text: 'Description', isfalse: false),
//             Container(
//               padding: EdgeInsets.all(10),
//               width: 370,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.grey.shade100,
//               ),
//               child: DropdownButton<Status>(
//                 hint: Text('Status'),
//                 dropdownColor: Colors.grey.shade100,
//                 value: selectedStatus,
//                 onChanged: (value) {
//                   selectedStatus = value;
//                 },
//                 items: Status.values.map((Status value) {
//                   return DropdownMenuItem<Status>(
//                     value: value,
//                     child: Text(value.toString().split('.').last),
//                   );
//                 }).toList(),
//               ),
//             ),
//             ElevatedButton(
//               style: ButtonStyle(
//                   backgroundColor: MaterialStatePropertyAll(Colors.black)),
//               child: const Text('Add'),
//               onPressed: () {
//                 if (title.text.isNotEmpty && description.text.isNotEmpty) {
//                   final TaskModel newTask = TaskModel(
//                     title: title.text,
//                     description: description.text,
//                     status: selectedStatus!,
//                   );
//                   Provider.of<TaskVM>(context, listen: false).addTask(newTask);

//                   title.clear();
//                   description.clear();

//                   Navigator.pop(context);
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
