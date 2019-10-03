import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import '../main/ingredients.dart';

class Splash extends StatelessWidget {
  const Splash({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FlareActor(
          "assets/splash.flr",
          animation: "Loading",
          callback: (name) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return Ingredients();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
