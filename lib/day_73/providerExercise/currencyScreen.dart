import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/day_73/providerExercise/currencyprovider.dart';
import 'package:provider/provider.dart';

class CurrencyScreen extends StatelessWidget {
  const CurrencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrencyProvider>(
      builder: (context, value, child) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.purple,
            ),
            body: ListView.builder(
              itemCount: value.currency.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${value.currency[index].code}'),
                  subtitle: Text('${value.currency[index].price}'),
                  trailing: IconButton(
                      onPressed: () {
                        if (value.currency[index].isSelected != false){
                          value.removeCurrency(value.currency[index]);
                        }else{
                          value.currency[index].isSelected = true;
                          value.addCurrency(value.currency[index]);
                        }
                      },
                      icon: Icon(
                        Icons.check_circle,
                        color: value.currency[index].isSelected
                            ? Colors.green
                            : Colors.grey,
                      )),
                );
              },
            ));
      },
    );
  }
}
