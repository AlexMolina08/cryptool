import 'dart:io';

import 'package:cryptool/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:cryptool/services/network.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  List<Text> currencies ;
  int selectedCurrencyIndex = 0;
  String selectedCurrencyValue ;
  String selectedCurrencyName;



  @override
  void initState() {
    super.initState();
    currencies = getCurrenciesWidget(); //al crear price_screen , obtenemos la lista de valores

  }

  void updateUI(dynamic coin_data) {
    setState(() {
      selectedCurrencyName = currenciesList[selectedCurrencyIndex];
      if (coin_data != null){
        selectedCurrencyValue = coin_data[0]["price"];
      }
    });
  }

  // obtiene el valor del bitcoin en EUR
  Future<dynamic> getCryptoValues() async{
    Network network = Network(apiUrl: 'https://api.nomics.com/v1/currencies/ticker?key=3c5bbdd979e0d1fb076d1e66f3e22fa6&ids=BTC,nterval=1d,30d&convert=$selectedCurrencyName');

    var eur = await network.getData();

    return eur;

  }

  /*
  * Obtiene las divisas de la lista currenciesList (coin_data.dart)
  * */
  List<Text> getCurrenciesWidget() {
    List<Text> currencies = [];
    for (String currency in currenciesList) {
      currencies.add(
        Text(currency),
      );
    }
    return currencies;
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
        backgroundColor: Colors.green,
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
              color: Colors.lime,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text('1 BTC = $selectedCurrencyValue ${currenciesList[selectedCurrencyIndex]}',
                    textAlign: TextAlign.center, style: priceTextStyle),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.green,
            child: CupertinoPicker(
              backgroundColor: Colors.green,
              /*Altura del widget*/
              itemExtent: 32.0,
              /*callback a funcion que se ejecuta cuando el user hace scroll en el picker*/
              onSelectedItemChanged: (selectedIndex) async{
                print(selectedIndex);
                setState(() {
                  selectedCurrencyIndex = selectedIndex;
                });

                dynamic eur_data = await getCryptoValues();
                updateUI(eur_data);

              },
              /*Lista de widgets */
              children: currencies,
            ),
          ),
        ],
      ),
    );
  }
}

/*DropdownButton<String>(
items: getDropdownList(),
value: selectedCurrency,

onChanged: (value) {
setState(() {
selectedCurrency = value;
print(value);
});
}),
),*/
