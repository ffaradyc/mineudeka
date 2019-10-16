import 'package:flutter/material.dart';


class TitleCocktailWidget extends StatelessWidget {
  const TitleCocktailWidget({
    Key key,
    @required this.snapshot,
  }) : super(key: key);

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 30),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffA701E2),
            Color(0xffDC00E0),
          ],
        ),
      ),
      child: Column(
        children: <Widget>[
          Text(
            snapshot.data.drinks[0].strDrink,
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
              color: Colors.white70,
              shadows: [
                Shadow(
                  blurRadius: 5.0,
                  color: Colors.black38,
                  offset: Offset(0, 4.0),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            snapshot.data.drinks[0].strAlcoholic,
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 20.0,
              fontWeight: FontWeight.w300,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
