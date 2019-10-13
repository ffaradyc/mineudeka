import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.asset('assets/top.png'),
              Positioned(
                top: 40.0,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(
                        'https://picsum.photos/id/1/800/600',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              AppBar(
                backgroundColor: Color(0x22A701E2),
                title: Text('Hallo WOrld'),
              ),
            ],
          ),
          Text(
            'Hello World',
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 36.0,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
