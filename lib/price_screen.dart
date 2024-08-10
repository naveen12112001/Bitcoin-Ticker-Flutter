import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  double currency = 0.0;
  var bdisplayValue;
  var edisplayValue;
  var ldisplayValue;

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) async {
        CoinData cd = CoinData();
        var btcresult = await cd.getCoinData('BTC', selectedCurrency);
        var ethresult = await cd.getCoinData('ETH', selectedCurrency);
        var ltcresult = await cd.getCoinData('LTC', selectedCurrency);
        setState(() {
          selectedCurrency = value!;
          bdisplayValue = btcresult.toInt();
          edisplayValue = ethresult.toInt();
          ldisplayValue = ltcresult.toInt();
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
        });
      },
      children: pickerItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $bdisplayValue $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ETH = $edisplayValue $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 LTC = $ldisplayValue $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 300.0),
            child: Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 10.0),
              color: Colors.lightBlue,
              child: Platform.isIOS ? iOSPicker() : androidDropdown(),
            ),
          ),
        ],
      ),
    );
  }
}

// DropdownButton<String> androidDropdown() {
//   List<DropdownMenuItem<String>> dropdownItems = [];
//   for (String currency in currenciesList) {
//     var newItem = DropdownMenuItem(
//       child: Text(currency),
//       value: currency,
//     );
//     dropdownItems.add(newItem);
//   }
//
//   return DropdownButton<String>(
//     value: selectedCurrency,
//     items: dropdownItems,
//     onChanged: (value) {
//       setState(() {
//         selectedCurrency = value;
//         getData();
//       });
//     },
//   );
// }
