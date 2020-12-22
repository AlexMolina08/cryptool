import 'package:flutter/material.dart';
import 'package:cryptool/price_screen.dart';

void main() => runApp(CryptoolApp());

class CryptoolApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: PriceScreen()
    );
  }
}

