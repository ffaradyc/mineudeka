import 'package:flutter/material.dart';
import 'package:mineudeka/main/about.dart';
import 'package:mineudeka/main/ingredients.dart';
import 'package:mineudeka/main/main_search.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  // ignore: missing_return, non_constant_identifier_names
  Widget CallPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return Ingredients();
      case 1:
        return MainSearch();
      case 2:
        return About();
        break;
      default:
        return Ingredients();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CallPage(_currentIndex),
      bottomNavigationBar: SizedBox(
        height: 48.0,
        child: BottomNavigationBar(
          iconSize: 20,
          elevation: 10.0,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          backgroundColor: Colors.purple,
          currentIndex: _currentIndex,
          onTap: (value) {
            _currentIndex = value;
            setState(() {});
          },
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white30,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.cocktail),
              title: Text('Ingredients'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_pin),
              title: Text('About Us'),
            ),
          ],
        ),
      ),
    );
  }
}
