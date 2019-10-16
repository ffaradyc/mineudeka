import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mineudeka/detail/detail.dart';

import '../model/cocktails_list.dart';
import 'package:http/http.dart' as http;

import 'dart:async';

class ListCocktails extends StatelessWidget {
  const ListCocktails({Key key, this.strIngredient}) : super(key: key);
  final String strIngredient;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(backgroundColor: Color(0xffA701E2),),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image(
                image: AssetImage('assets/top.png'),
              ),
              Positioned.fill(
                top: 40.0,
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://www.thecocktaildb.com/images/ingredients/$strIngredient-medium.png',
                    height: 240.0,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              /* Positioned.fill(
                top: 10.0,
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
              ), */
              AppBar(
                backgroundColor: Color(0x22A701E2),
                title: Text('$strIngredient'),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: ListCocktailsWidget(
              strIngredient: strIngredient,
            ),
          )
        ],
      ),
    );
  }
}

class ListCocktailsWidget extends StatefulWidget {
  ListCocktailsWidget({Key key, this.strIngredient}) : super(key: key);

  final String strIngredient;

  _ListCocktailsWidgetState createState() =>
      _ListCocktailsWidgetState(strIngredient);
}

class _ListCocktailsWidgetState extends State<ListCocktailsWidget> {
  _ListCocktailsWidgetState(this.strIngredient);

  String strIngredient;

  Future<ListCocktailsData> _getCocktailsList() async {
    String url =
        'https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=$strIngredient';
    http.Response response = await http.get(
      Uri.encodeFull(url),
      headers: {"Accept": "application/json"},
    );
    if (response.statusCode == 200) {
      return listCocktailsDataFromJson(response.body);
    } else {
      throw Exception('Failed to Load Data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Container(
            //height: 120.0,
            child: FutureBuilder(
              future: _getCocktailsList(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    height: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        SizedBox(height: 10.0),
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
                    maxCrossAxisExtent: 180.0,
                  ),
                  itemCount: snapshot.data.drinks.length,
                  itemBuilder: (BuildContext context, int index) {
                    //return Padding(padding: EdgeInsets.all(5.0) ,child: Text('$snapshot.data.drinks[index].strIngredient1'),);
                    return CocktailsDataWidget(
                        drinkIngredient: snapshot.data.drinks[index]);
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class CocktailsDataWidget extends StatelessWidget {
  const CocktailsDataWidget({Key key, this.drinkIngredient}) : super(key: key);

  final DrinkIngredient drinkIngredient;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return DetailPage(idDrink: drinkIngredient.idDrink);
              },
            ),
          );
        },
        child: Card(
          elevation: 10.0,
          child: Container(
            margin: EdgeInsets.all(0),
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
            child: Stack(
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: drinkIngredient.strDrinkThumb.replaceFirst(RegExp(r'drink'), 'drink\/small'),
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  fit: BoxFit.fill,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      color: Color(0x88730073),
                      width: double.infinity,
                      child: Text(
                        drinkIngredient.strDrink,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                          fontFamily: 'Nunito',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
