import 'package:flutter/material.dart';
import 'package:mineudeka/main/search.dart';
import 'package:mineudeka/network/api_client.dart';
import 'package:mineudeka/model/drinks.dart';
import 'package:mineudeka/detail/detail.dart';

class MainSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchBare(),
    );
  }
}

class SearchBare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Find Your Drinks"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return SearchPage();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: SearchContent(""),
    );
  }
}

class SearchContent extends StatelessWidget {
  final String drinksName;

  SearchContent(this.drinksName);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<Drinks>(
        future: ApiClient.getDrinks(drinksName),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          Drinks drinksList = snapshot.data;
          bool connect = snapshot.connectionState == ConnectionState.done;
          if (snapshot.hasData && connect) {
            return ListView.builder(
              itemCount: drinksList.drinks.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(drinksList.drinks[index].strDrink),
                  subtitle: Text(drinksList.drinks[index].strGlass),
                  trailing: Text(drinksList.drinks[index].strCategory),
                  leading: Image.network(
                      drinksList.drinks[index].strDrinkThumb),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return DetailPage(idDrink: drinksList.drinks[index].idDrink);
                        },
                      ),
                    );
//                    SnackBar snackbar = SnackBar(
//                      content: Text(
//                        drinksList.drinks[index].strDrink,
//                      ),
//                    );
//                    Scaffold.of(context).showSnackBar(snackbar);
                  },
                );
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
