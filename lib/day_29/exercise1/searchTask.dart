import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/day_29/exercise1/exercise1.dart';
import 'package:faker/faker.dart';

class SearchBarApp extends StatefulWidget {
  const SearchBarApp({super.key});

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  List<PersonClass> lis = generetList();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SearchBar(
                padding: const MaterialStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 16.0)),
                onTap: () {},
                onChanged: (search) {
                  if (search.isEmpty) {
                    lis = lis;
                  }
                  lis = lis
                      .where((element) => element.email.contains(search))
                      .toList();
                  setState(() {});
                },
                leading: const Icon(Icons.search),
              ),
              Expanded(
                  child: Container(
                child: ListView.builder(
                  itemCount: lis.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("${lis[index].name}"),
                      subtitle: Text("${lis[index].email}"),
                    );
                  },
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

generetList() {
  return List.generate(
      10, (index) => PersonClass(faker.person.name(), faker.internet.email()));
}
