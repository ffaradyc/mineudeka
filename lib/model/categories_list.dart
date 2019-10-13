// To parse this JSON data, do
//
//     final categoryList = categoryListFromJson(jsonString);

import 'dart:convert';

CategoryList categoryListFromJson(String str) => CategoryList.fromJson(json.decode(str));

String categoryListToJson(CategoryList data) => json.encode(data.toJson());

class CategoryList {
    List<ListCategory> listCategory;

    CategoryList({
        this.listCategory,
    });

    factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
        listCategory: List<ListCategory>.from(json["listCategory"].map((x) => ListCategory.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "listCategory": List<dynamic>.from(listCategory.map((x) => x.toJson())),
    };
}

class ListCategory {
    String strCategory;

    ListCategory({
        this.strCategory,
    });

    factory ListCategory.fromJson(Map<String, dynamic> json) => ListCategory(
        strCategory: json["strCategory"],
    );

    Map<String, dynamic> toJson() => {
        "strCategory": strCategory,
    };
}
