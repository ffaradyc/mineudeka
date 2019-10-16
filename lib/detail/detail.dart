import 'package:flutter/material.dart';
//import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:mineudeka/model/drinks_model.dart';
import 'package:http/http.dart' as http;

import 'dart:async';

import 'ingredient_cocktail.dart';
import 'instruction.dart';
import 'title.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key key, this.idDrink}) : super(key: key);

  final String idDrink;

  @override
  _DetailPageState createState() => _DetailPageState(idDrink: idDrink);
}

class _DetailPageState extends State<DetailPage> {
  _DetailPageState({this.idDrink});
  final String idDrink;
  Future<CocktailsModel> _getCocktailsData() async {
    String url =
        'https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=$idDrink';
    http.Response response = await http.get(
      Uri.encodeFull(url),
      headers: {"Accept": "applicaton/json"},
    );
    if (response.statusCode == 200) {
      return cocktailsModelFromJson(response.body);
    } else {
      throw Exception('Failed to Load Data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: _getCocktailsData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    SizedBox(height: 10.0),
                    Text("Loading"),
                  ],
                ),
              );
            }
            return new DetailPageWidget(snapshot: snapshot);
          }),
    );
  }
}

class DetailPageWidget extends StatelessWidget {
  const DetailPageWidget({Key key, this.snapshot}) : super(key: key);

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Image.asset('assets/top.png'),
            Positioned.fill(
              top: 20.0,
              child: Center(
                child: Container(
                  padding: EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: CachedNetworkImage(
                      imageUrl: snapshot.data.drinks[0].strDrinkThumb,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) =>
                          new Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            ),
            AppBar(
              backgroundColor: Color(0x22A701E2),
              elevation: 0,
              title: Text(
                snapshot.data.drinks[0].strDrink,
                style: TextStyle(
                  fontFamily: 'Nunito',
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 640.0,
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Card(
                      elevation: 8.0,
                      child: Column(
                        children: <Widget>[
                          new TitleCocktailWidget(snapshot: snapshot),
                          SizedBox(height: 20.0),
                          new CategoryWidget(snapshot: snapshot),
                          SizedBox(height: 20.0),
                          InstructionsWidget(snapshot: snapshot),
                          SizedBox(height: 20.0),
                          Expanded(
                            child: IngredientsTitleWidget(
                                snapshot:
                                    snapshot.data.drinks[0].lstIngredients),
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
