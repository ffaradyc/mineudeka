// To parse this JSON data, do
//
//     final ListCocktailsData = ListCocktailsDataFromJson(jsonString);

import 'dart:convert';

ListCocktailsData listCocktailsDataFromJson(String str) => ListCocktailsData.fromJson(json.decode(str));

String listCocktailsDataToJson(ListCocktailsData data) => json.encode(data.toJson());

class ListCocktailsData {
    List<DrinkIngredient> drinks;

    ListCocktailsData({
        this.drinks,
    });

    factory ListCocktailsData.fromJson(Map<String, dynamic> json) => ListCocktailsData(
        drinks: json["drinks"] == null ? null : List<DrinkIngredient>.from(json["drinks"].map((x) => DrinkIngredient.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "drinks": drinks == null ? null : List<dynamic>.from(drinks.map((x) => x.toJson())),
    };
}

class DrinkIngredient {
    String strDrink;
    String strDrinkThumb;
    String idDrink;

    DrinkIngredient({
        this.strDrink,
        this.strDrinkThumb,
        this.idDrink,
    });

    factory DrinkIngredient.fromJson(Map<String, dynamic> json) => DrinkIngredient(
        strDrink: json["strDrink"] == null ? null : json["strDrink"],
        strDrinkThumb: json["strDrinkThumb"] == null ? null : json["strDrinkThumb"],
        idDrink: json["idDrink"] == null ? null : json["idDrink"],
    );

    Map<String, dynamic> toJson() => {
        "strDrink": strDrink == null ? null : strDrink,
        "strDrinkThumb": strDrinkThumb == null ? null : strDrinkThumb,
        "idDrink": idDrink == null ? null : idDrink,
    };
}
