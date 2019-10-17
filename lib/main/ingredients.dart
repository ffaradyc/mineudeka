import 'package:flutter/material.dart';
import 'package:mineudeka/cocktail/list_cocktails.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:http/http.dart' as http;
import 'dart:async';

import '../model/ingredients_list.dart';

class Ingredients extends StatefulWidget {
  @override
  _IngredientsState createState() => _IngredientsState();
}

class _IngredientsState extends State<Ingredients> {
  Future<IngredientsList> _getIngredientList() async {
    String url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list';
    http.Response response = await http.get(
      Uri.encodeFull(url),
      headers: {"Accept": "applicaton/json"},
    );
    if (response.statusCode == 200) {
      return ingredientsListFromJson(response.body);
    } else {
      throw Exception('Failed to Load Data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/slice.png'),
                  fit: BoxFit.fill,
                ),
                Positioned.fill(
                  top: 40.0,
                  child: Center(
                    child: Text(
                      'Mineudeka!',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 48.0,
                        fontWeight: FontWeight.w900,
                        //color: Color(0xff710099),
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 5.0,
                            color: Color(0x55AB01E2),
                            offset: Offset(0, 4.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Container(
              //height: 120.0,
              child: FutureBuilder(
                future: _getIngredientList(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      height: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircularProgressIndicator(),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text("Loading"),
                        ],
                      ),
                    );
                  }
                  return GridView.builder(
                    padding: EdgeInsets.all(10.0),
                    //scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      maxCrossAxisExtent: 120.0,
                    ),
                    itemCount: snapshot.data.drinks.length,
                    itemBuilder: (BuildContext context, int index) {
                      //return Padding(padding: EdgeInsets.all(5.0) ,child: Text('$snapshot.data.drinks[index].strIngredient1'),);
                      return IngredientsListWidget(
                        strIngredient1:
                            snapshot.data.drinks[index].strIngredient1,
                      );
                    },
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}

class IngredientsListWidget extends StatelessWidget {
  IngredientsListWidget({Key key, this.strIngredient1 = ''}) : super(key: key);

  final String strIngredient1;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return ListCocktails(
                strIngredient: strIngredient1,
              );
            },
          ),
        );
      },
      child: Container(
        //margin: EdgeInsets.only(left: 10.0, right: 10.0),
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xffDC00E0), Color(0xffA701E2)],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(6.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: CachedNetworkImage(
                imageUrl:
                    'https://www.thecocktaildb.com/images/ingredients/$strIngredient1-small.png',
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => new Icon(Icons.error),
              ),
            ),
            Text(
              '$strIngredient1',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.0,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
