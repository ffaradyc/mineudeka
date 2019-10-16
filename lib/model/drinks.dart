import 'dart:convert';

Drinks drinksFromJson(String str) => Drinks.fromJson(json.decode(str));

String drinksToJson(Drinks data) => json.encode(data.toJson());

class Drinks {
  List<ItemDrinks> drinks;

  Drinks({this.drinks});

  factory Drinks.fromJson(Map<String, dynamic> json) => Drinks(
      drinks: List<ItemDrinks>.from(
          json["drinks"].map((x) => ItemDrinks.fromJson(x))));

  Map<String, dynamic> toJson() =>
      {"drinks": List<dynamic>.from(drinks.map((x) => x.toJson()))};
}

class ItemDrinks {
  String idDrink;
  String strDrink;
  String strCategory;
  String strGlass;
  String strDrinkThumb;

  ItemDrinks(
      {this.idDrink,
      this.strDrink,
      this.strCategory,
      this.strGlass,
      this.strDrinkThumb});

  factory ItemDrinks.fromJson(Map<String, dynamic> json) => ItemDrinks(
      idDrink: json["idDrink"],
      strDrink: json["strDrink"],
      strCategory: json["strCategory"],
      strGlass: json["strGlass"],
      strDrinkThumb: json["strDrinkThumb"]);

  Map<String, dynamic> toJson() => {
        "idDrink": idDrink,
        "strDrink": strDrink,
        "strCategory": strCategory,
        "strGlass": strGlass,
        "strDrinkThumb": strDrinkThumb
      };
}
