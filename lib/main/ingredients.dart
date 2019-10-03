import 'package:flutter/material.dart';

class Ingredients extends StatelessWidget {
  const Ingredients({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image(
            image: AssetImage('assets/slice.png'),
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            height:280.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                IngredientsList(),
                IngredientsList(),
                IngredientsList(),
                IngredientsList(),
                IngredientsList(),
                IngredientsList(),
                IngredientsList(),
              ],
            ),
          ),
          Center(
            child: Text(
              'Mineudeka!',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 56.0,
                fontWeight: FontWeight.w900,
                color: Color(0xff710099),
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
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.purple,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            title: Text('Home', style: TextStyle(color: Colors.white)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.android, color: Colors.white70),
            title: Text('Home', style: TextStyle(color: Colors.white70)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo, color: Colors.white70),
            title: Text('Home', style: TextStyle(color: Colors.white70)),
          ),
        ],
      ),
    );
  }
}

class IngredientsList extends StatelessWidget {
  const IngredientsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0),
      height: 280.0,
      width: 180.0,
      padding: EdgeInsets.all(10.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xffDC00E0), Color(0xffA701E2)]),
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              'Orange Mojito',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.white60,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            'Aute culpa esse adipisicing mollit qui eiusmod. Amet tempor consectetur pariatur tempor aute magna id officia commodo aute ipsum. Irure consequat consectetur incididunt magna. Lorem do quis sunt nostrud culpa laboris non et aliquip.',
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 12.0,
              color: Colors.white,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
