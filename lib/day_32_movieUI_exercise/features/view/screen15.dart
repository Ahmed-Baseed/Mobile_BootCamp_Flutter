import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/features/view/signinPage.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    bool showCheckIcon = true;
    List<Map<String, dynamic>> payList = [
      {
        'name': 'Visa',
        'type': Logos.visa,
      },
      {
        'name': 'Master card',
        'type': Logos.mastercard,
      },
      {
        'name': 'Paypal',
        'type': Logos.cc_paypal,
      },
    ];
    return Scaffold(
        backgroundColor: Color.fromRGBO(33, 37, 41, 1),
        appBar: AppBar(
          title: Text("CATEGORY"),
          backgroundColor: Color.fromRGBO(33, 37, 41, 1),
          iconTheme: IconThemeData(color: Colors.amberAccent),
          elevation: 10,
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: EdgeInsets.only(left: 15, top: 40),
            child: SizedBox(
              height: 130,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  width: 5,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) => Column(
                  children: [
                    InkWell(
                      onTap: () {
                        showCheckIcon = !showCheckIcon;
                        setState(() {});
                      },
                      child: Card(
                        child: Container(
                            width: 130,
                            height: 80,
                            child: Center(
                                child: showCheckIcon
                                    ? Logo(
                                        payList[index]['type'],
                                        size: 60,
                                      )
                                    : Icon(
                                        Icons.check_circle,
                                        color: Colors.amber,
                                        size: 40,
                                      ))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("${payList[index]['name']}",
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 15,
              top: 30,
              right: 15,
            ),
            child: ExpansionPanelList(
              elevation: 0,
              expandIconColor: Colors.white,
              expansionCallback: (int index, bool isExpanded) {},
              children: [
                ExpansionPanel(
                  backgroundColor: Color(0xff303133),
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Master Card',
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            mediamSpace(),
                            Row(
                              children: [
                                Logo(
                                  Logos.mastercard,
                                  size: 20,
                                ),
                                Text("    *************** 569",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                          ]),
                    );
                  },
                  body: ListTile(
                    title: Text('Item 1 child'),
                    subtitle: Text('Details goes here'),
                  ),
                  isExpanded: false,
                ),
              ],
            ),
          ),
          mediamSpace(),
          Container(
            height: 50,
            padding: EdgeInsets.only(left: 15, right: 15),
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.grey[700])),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle_outline,
                      color: Colors.amber,
                    ),
                    Text(
                      "  ADD NEW CARD",
                      style: TextStyle(
                          color: Colors.amber, fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Total: \$589",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                mediamSpace(),
                Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.grey[700])),
                      onPressed: () {},
                      child: Text(
                        "PAY & CONFIRM",
                        style: TextStyle(
                            color: Colors.amber, fontWeight: FontWeight.bold),
                      ),
                    )),
                mediamSpace()
              ],
            ),
          ),
        ]));
  }
}
