// To parse this JSON data, do
//
//     final ingredientDetail = ingredientDetailFromJson(jsonString);

import 'dart:convert';

IngredientDetail ingredientDetailFromJson(String str) => IngredientDetail.fromJson(json.decode(str));

String ingredientDetailToJson(IngredientDetail data) => json.encode(data.toJson());

class IngredientDetail {
    List<Ingredient> ingredients;

    IngredientDetail({
        this.ingredients,
    });

    factory IngredientDetail.fromJson(Map<String, dynamic> json) => IngredientDetail(
        ingredients: List<Ingredient>.from(json["ingredients"].map((x) => Ingredient.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
    };
}

class Ingredient {
    String idIngredient;
    String strIngredient;
    String strDescription;
    String strType;
    String strAlcohol;
    dynamic strAbv;

    Ingredient({
        this.idIngredient,
        this.strIngredient,
        this.strDescription,
        this.strType,
        this.strAlcohol,
        this.strAbv,
    });

    factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        idIngredient: json["idIngredient"],
        strIngredient: json["strIngredient"],
        strDescription: json["strDescription"],
        strType: json["strType"],
        strAlcohol: json["strAlcohol"],
        strAbv: json["strABV"],
    );

    Map<String, dynamic> toJson() => {
        "idIngredient": idIngredient,
        "strIngredient": strIngredient,
        "strDescription": strDescription,
        "strType": strType,
        "strAlcohol": strAlcohol,
        "strABV": strAbv,
    };
}
