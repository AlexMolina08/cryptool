import 'dart:io';

import 'package:cryptool/coin_data.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = currenciesList[0];

  List<DropdownMenuItem> getDropdownList() {
    List<DropdownMenuItem<String>> dropdownList = [];

    for (String item in currenciesList ) {
      dropdownList.add(DropdownMenuItem(
        child: Text(item),
        value: item,
      ));
    }

    return dropdownList;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "🤑 CrypTool 🤑",
            style: appBarTextStyle,
          ),
        ),
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
        ),
        shadowColor: Colors.green[900],
        toolbarHeight: 70.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 10.0),
            child: Card(
              color: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text('1 BTC = ? EUR',
                    textAlign: TextAlign.center, style: priceTextStyle),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.deepOrangeAccent,
            child: DropdownButton<String>(
                items: getDropdownList(),
                value: selectedCurrency,

                onChanged: (value) {
                  setState(() {
                    selectedCurrency = value;
                    print(value);
                  });
                }),
          ),
        ],
      ),
    );
  }
}
