import 'package:flutter/material.dart';

class ExpantionPanelExample extends StatefulWidget {
  const ExpantionPanelExample({super.key});

  @override
  State<ExpantionPanelExample> createState() => _ExpantionPanelExampleState();
}

class _ExpantionPanelExampleState extends State<ExpantionPanelExample> {
  @override
  Widget build(BuildContext context) {
    bool active = false;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ExpansionPanelList(
            expansionCallback: (panelIndex, isExpanded) {
              active = !active;
              setState(() {});
            },
            children: [
              ExpansionPanel(
                isExpanded: active,
                  headerBuilder: (context, isExpanded) {
                    return Text("Buttons");
                  },
                  body: Column(
                    children: [
                      ElevatedButton(onPressed: null, child: Text("Football")),
                      ElevatedButton(onPressed: null, child: Text("Tennis")),
                      ElevatedButton(onPressed: null, child: Text("Fencing")),
                      ElevatedButton(onPressed: null, child: Text("Swimming")),
                      ElevatedButton(onPressed: null, child: Text("Hockey")),
                      ElevatedButton(onPressed: null, child: Text("Karate")),
                    ],
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
