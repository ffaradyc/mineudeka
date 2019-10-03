import 'package:flutter/material.dart';
import './splash/splash.dart';


void main() => runApp(Mineudeka());

class Mineudeka extends StatelessWidget {
  const Mineudeka({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: Splash(),
    );
  }
}
