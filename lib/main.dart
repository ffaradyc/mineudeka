import 'package:flutter/material.dart';
import 'package:mineudeka/splash/splash.dart';
import 'package:mineudeka/main/ingredients.dart';
import 'package:mineudeka/main/about.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/' : (context) => Splash(),
    'home' : (context) => Ingredients(),
    'about' : (context) => About(),
  },
));
