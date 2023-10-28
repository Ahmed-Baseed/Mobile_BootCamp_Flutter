import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/core/components/subscription.dart';

class SubscriptionPlan extends StatefulWidget {
  const SubscriptionPlan({super.key});

  @override
  State<SubscriptionPlan> createState() => _SubscriptionPlanState();
}

class _SubscriptionPlanState extends State<SubscriptionPlan> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> mapList = [
      {
        'plan': 'Monthly Price',
        'description': 'USD 256.99',
      },
      {
        'plan': 'Multiple devices',
        'description': '2',
      },
      {
        'plan': 'Cancel at any time',
        'description': 'better',
      },
      {
        'plan': 'Resolution',
        'description': '1080p',
      },
    ];

    return SubscriptionComponents(
      container: Container(
        child: Column(
          children: [
            for (int j = 0; j < 4; j++)
              Container(
                padding: EdgeInsets.only(bottom: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (int i = 0; i < 3; i++)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("${mapList[j]['plan']}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12)),
                          smallSpace(),
                          Text("${mapList[j]['description']}",
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 12)),
                        ],
                      ),
                  ],
                ),
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
