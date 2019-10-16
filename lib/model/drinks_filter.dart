// To parse this JSON data, do
//
//     final ingredientFilter = ingredientFilterFromJson(jsonString);

import 'dart:convert';

IngredientFilter ingredientFilterFromJson(String str) => IngredientFilter.fromJson(json.decode(str));

String ingredientFilterToJson(IngredientFilter data) => json.encode(data.toJson());

class IngredientFilter {
    List<DrinksFilter> drinksFilter;

    IngredientFilter({
        this.drinksFilter,
    });

    factory IngredientFilter.fromJson(Map<String, dynamic> json) => IngredientFilter(
        drinksFilter: List<DrinksFilter>.from(json["drinks_filter"].map((x) => DrinksFilter.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "drinks_filter": List<dynamic>.from(drinksFilter.map((x) => x.toJson())),
    };
}

class DrinksFilter {
    String strDrink;
    String strDrinkThumb;
    String idDrink;

    DrinksFilter({
        this.strDrink,
        this.strDrinkThumb,
        this.idDrink,
    });

    factory DrinksFilter.fromJson(Map<String, dynamic> json) => DrinksFilter(
        strDrink: json["strDrink"],
        strDrinkThumb: json["strDrinkThumb"],
        idDrink: json["idDrink"],
    );

    Map<String, dynamic> toJson() => {
        "strDrink": strDrink,
        "strDrinkThumb": strDrinkThumb,
        "idDrink": idDrink,
    };
}
