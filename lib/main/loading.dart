import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class LoadingEudeka extends StatelessWidget {
  const LoadingEudeka({Key key, this.anim = "Loading"}) : super(key: key);
  final String anim;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:150,
      width:200,
      child: FlareActor(
        "assets/loading.flr",
        fit: BoxFit.fill,
        animation: this.anim,
        alignment: Alignment.center,
      )
    );
  }
}