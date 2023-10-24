import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableExample extends StatefulWidget {
  const SlidableExample({super.key});

  @override
  State<SlidableExample> createState() => _SlidableExampleState();
}

class _SlidableExampleState extends State<SlidableExample> {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Slidable(
            key: ValueKey(0),
            child: ListTile(title: Text("SlideMe")),
            startActionPane: ActionPane(
                dismissible: DismissiblePane(onDismissed: () {}),
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (ctx) {},
                    backgroundColor: Color.fromARGB(255, 199, 202, 33),
                    foregroundColor: Colors.white,
                    icon: Icons.archive,
                    label: 'Archive',
                  ),
                  SlidableAction(
                    onPressed: (ctx) {},
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                  SlidableAction(
                    onPressed: (ctx) {},
                    backgroundColor: Color(0xFF21B7CA),
                    foregroundColor: Colors.white,
                    icon: Icons.share,
                    label: 'Share',
                  ),
                ]),
          );
        },
      ),
    );
  }
}
