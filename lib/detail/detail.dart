import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset('assets/top.png'),
                Padding(
                  padding: const EdgeInsets.all(60.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                      'https://picsum.photos/id/1/800/600',
                      fit: BoxFit.fill,
                    ),
                  ),
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
      ),
    );
  }
}
