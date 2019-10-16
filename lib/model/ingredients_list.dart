// To parse this JSON data, do
//
//     final ingredientsList = ingredientsListFromJson(jsonString);

import 'dart:convert';

IngredientsList ingredientsListFromJson(String str) => IngredientsList.fromJson(json.decode(str));

String ingredientsListToJson(IngredientsList data) => json.encode(data.toJson());

class IngredientsList {
    List<Drink> drinks;

    IngredientsList({
        this.drinks,
    });

    factory IngredientsList.fromJson(Map<String, dynamic> json) => IngredientsList(
        drinks: json["drinks"] == null ? null : List<Drink>.from(json["drinks"].map((x) => Drink.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "drinks": drinks == null ? null : List<dynamic>.from(drinks.map((x) => x.toJson())),
    };
}

class Drink {
    String strIngredient1;

    Drink({
        this.strIngredient1,
    });

    factory Drink.fromJson(Map<String, dynamic> json) => Drink(
        strIngredient1: json["strIngredient1"] == null ? null : json["strIngredient1"],
    );

    Map<String, dynamic> toJson() => {
        "strIngredient1": strIngredient1 == null ? null : strIngredient1,
    };
}
