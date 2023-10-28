import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/features/view/paymentPage.dart';

class PayMethod extends StatefulWidget {
  const PayMethod({super.key});

  @override
  State<PayMethod> createState() => _PayMethodState();
}

int? selectedValue;

class _PayMethodState extends State<PayMethod> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> payList = [
      {
        'name': 'Mastercard',
        'type': Logo(Logos.mastercard,size: 25,),
      },
      {
        'name': 'Visa',
        'type': Logo(Logos.cc_visa,size: 25,),
      },
      {
        'name': 'Paypal',
        'type': Logo(Logos.paypal,size: 25,),
      },
    ];
    List<Map<String, dynamic>> infoList = [
      {
        'item': 'Time duration',
        'choice': '15 days',
      },
      {
        'item': 'Video quality',
        'choice': 'Best',
      },
      {
        'item': 'Devices',
        'choice': '03',
      },
      {
        'item': 'Cancel at any time',
        'choice': 'Yes',
      },
    ];
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 37, 41, 1),
      appBar: AppBar(
        title: Text("PAYMENT METHOD"),
        backgroundColor: Color.fromRGBO(33, 37, 41, 1),
        iconTheme: IconThemeData(color: Colors.amberAccent),
        elevation: 10,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 30, right: 15, bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "CHOOSE YOUR PYMENT METHOD",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            smallSpace(),
            for (int i = 0; i < 4; i++)
              Flexible(
                  child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  "${infoList[i]['item']}",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: Text("${infoList[i]['choice']}",
                    style: TextStyle(
                      color: Colors.white,
                    )),
              )),
            Divider(
              color: Colors.white,
              thickness: 0.1,
            ),
            mediamSpace(),
            for (int i = 0; i < 3; i++)
              Row(
                children: [
                  Flexible(
                    child: RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      fillColor: MaterialStatePropertyAll(Colors.amber,),
                      title: Text('${payList[i]['name']}',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      subtitle: Text('Pay from ${payList[i]['name']} account',
                          style: TextStyle(
                            color: Colors.grey,
                          )),
                      value: i + 1,
                      groupValue: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                    ),
                  ),
                  payList[i]['type']
                ],
              ),
            Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.grey[700])),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentPage(),
                        ));
                  },
                  child: Text(
                    "CONTINUE \$89",
                    style: TextStyle(
                        color: Colors.amberAccent, fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  smallSpace() {
    return SizedBox(
      height: 10,
    );
  }

  mediamSpace() {
    return SizedBox(
      height: 20,
    );
  }

  largeSpace() {
    return SizedBox(
      height: 40,
    );
  }
}
