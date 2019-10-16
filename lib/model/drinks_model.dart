import 'dart:convert';

CocktailsModel cocktailsModelFromJson(String str) => CocktailsModel.fromJson(json.decode(str));

String cocktailsModeloJson(CocktailsModel data) => json.encode(data.toJson());

class CocktailsModel {
  List<Drink> drinks;

  CocktailsModel({
    this.drinks,
  });

  factory CocktailsModel.fromJson(Map<String, dynamic> json) => CocktailsModel(
        drinks: List<Drink>.from(json["drinks"].map((x) => Drink.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
      };
}

class Drink {
  String idDrink;
  String strDrink;
  dynamic strDrinkAlternate;
  dynamic strDrinkEs;
  dynamic strDrinkDe;
  dynamic strDrinkFr;
  dynamic strDrinkZhHans;
  dynamic strDrinkZhHant;
  dynamic strTags;
  dynamic strVideo;
  String strCategory;
  dynamic strIba;
  String strAlcoholic;
  String strGlass;
  String strInstructions;
  dynamic strInstructionsEs;
  String strInstructionsDe;
  dynamic strInstructionsFr;
  dynamic strInstructionsZhHans;
  dynamic strInstructionsZhHant;
  String strDrinkThumb;
  String strCreativeCommonsConfirmed;
  String dateModified;
  List<IngredientMeasure> lstIngredients = [];

  Drink({
    this.idDrink,
    this.strDrink,
    this.strDrinkAlternate,
    this.strDrinkEs,
    this.strDrinkDe,
    this.strDrinkFr,
    this.strDrinkZhHans,
    this.strDrinkZhHant,
    this.strTags,
    this.strVideo,
    this.strCategory,
    this.strIba,
    this.strAlcoholic,
    this.strGlass,
    this.strInstructions,
    this.strInstructionsEs,
    this.strInstructionsDe,
    this.strInstructionsFr,
    this.strInstructionsZhHans,
    this.strInstructionsZhHant,
    this.strDrinkThumb,
    
    this.strCreativeCommonsConfirmed,
    this.dateModified,
    this.lstIngredients,
  });

  
  factory Drink.fromJson(Map<String, dynamic> json) => Drink(
        idDrink: json["idDrink"],
        strDrink: json["strDrink"],
        strDrinkAlternate: json["strDrinkAlternate"],
        strDrinkEs: json["strDrinkES"],
        strDrinkDe: json["strDrinkDE"],
        strDrinkFr: json["strDrinkFR"],
        strDrinkZhHans: json["strDrinkZH-HANS"],
        strDrinkZhHant: json["strDrinkZH-HANT"],
        strTags: json["strTags"],
        strVideo: json["strVideo"],
        strCategory: json["strCategory"],
        strIba: json["strIBA"],
        strAlcoholic: json["strAlcoholic"],
        strGlass: json["strGlass"],
        strInstructions: json["strInstructions"],
        strInstructionsEs: json["strInstructionsES"],
        strInstructionsDe: json["strInstructionsDE"] == null
            ? null
            : json["strInstructionsDE"],
        strInstructionsFr: json["strInstructionsFR"],
        strInstructionsZhHans: json["strInstructionsZH-HANS"],
        strInstructionsZhHant: json["strInstructionsZH-HANT"],
        strDrinkThumb: json["strDrinkThumb"],
        
        strCreativeCommonsConfirmed: json["strCreativeCommonsConfirmed"],
        dateModified: json["dateModified"],
        lstIngredients: takeData(json),
      );

  Map<String, dynamic> toJson() => {
        "idDrink": idDrink,
        "strDrink": strDrink,
        "strDrinkAlternate": strDrinkAlternate,
        "strDrinkES": strDrinkEs,
        "strDrinkDE": strDrinkDe,
        "strDrinkFR": strDrinkFr,
        "strDrinkZH-HANS": strDrinkZhHans,
        "strDrinkZH-HANT": strDrinkZhHant,
        "strTags": strTags,
        "strVideo": strVideo,
        "strCategory": strCategory,
        "strIBA": strIba,
        "strAlcoholic": strAlcoholic,
        "strGlass": strGlass,
        "strInstructions": strInstructions,
        "strInstructionsES": strInstructionsEs,
        "strInstructionsDE":
            strInstructionsDe == null ? null : strInstructionsDe,
        "strInstructionsFR": strInstructionsFr,
        "strInstructionsZH-HANS": strInstructionsZhHans,
        "strInstructionsZH-HANT": strInstructionsZhHant,
        "strDrinkThumb": strDrinkThumb,
        
        "strCreativeCommonsConfirmed": strCreativeCommonsConfirmed,
        "dateModified": dateModified,
      };

  static List<IngredientMeasure> takeData(Map<String, dynamic> json) {
    List<IngredientMeasure> data = new List<IngredientMeasure>();
    for (var i = 1; i <= 15; i++) {
      if (json['strIngredient$i'] == null) break;
      String strIngredient = json['strIngredient$i'];
      String strMeasurement = json['strMeasure$i'];
      data.add(IngredientMeasure(
          ingredientM: strIngredient, measureM: strMeasurement));
    }
    return data;
  }
}

class IngredientMeasure {
  String ingredientM;
  String measureM;
  IngredientMeasure({this.ingredientM, this.measureM});

}


