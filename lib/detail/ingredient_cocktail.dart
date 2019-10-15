import 'package:flutter/material.dart';
import 'package:mineudeka/model/drinks_model.dart';



class IngredientsTitleWidget extends StatelessWidget {
  const IngredientsTitleWidget({
    Key key,
    @required this.snapshot,
  }) : super(key: key);

  final List<IngredientMeasure> snapshot;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Ingredients',
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87),
        ),
        Expanded(
          child: ListView.builder(
            itemExtent: 15.0,
            itemCount: snapshot.length,
            itemBuilder: (context, index) {
              return IngredientListCocktailsWidget(
                ingredientMeasure: snapshot[index],
              );
            },
          ),
        ),
      ],
    );
  }
}

class IngredientListCocktailsWidget extends StatelessWidget {
  const IngredientListCocktailsWidget({Key key, this.ingredientMeasure})
      : super(key: key);

  final IngredientMeasure ingredientMeasure;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(fontSize: 14.0, color: Colors.black54),
        children: <TextSpan>[
          TextSpan(
            text: ingredientMeasure.ingredientM,
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          TextSpan(
            text: " : ",
          ),
          TextSpan(
            text: ingredientMeasure.measureM,
            style:
                TextStyle(fontWeight: FontWeight.normal, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
