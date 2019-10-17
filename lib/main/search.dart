import 'package:flutter/material.dart';
import 'package:mineudeka/main/loading.dart';
import 'package:mineudeka/network/api_client.dart';
import 'package:mineudeka/model/drinks.dart';
import 'package:mineudeka/detail/detail.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController editingController = TextEditingController();

  bool onSearch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: TextField(
          controller: editingController,
          autofocus: true,
          textInputAction: TextInputAction.go,
          decoration: InputDecoration(
//            enabledBorder: UnderlineInputBorder(
//              borderSide: BorderSide(color: Colors.purple),
//            ),
//            focusedBorder: UnderlineInputBorder(
//              borderSide: BorderSide(color: Colors.white),
//            ),
              ),
          onSubmitted: (v) {            
              onSearch = true;            
          },
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                onSearch = true;
              });
            },
          ),
        ],
      ),
      body: onSearch ? SearchContent(editingController.text) : Container(),
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
                  leading:
                      Image.network(drinksList.drinks[index].strDrinkThumb),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return DetailPage(
                              idDrink: drinksList.drinks[index].idDrink);
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
            return LoadingEudeka();
          }
        },
      ),
    );
  }
}
