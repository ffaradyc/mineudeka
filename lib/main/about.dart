import 'package:flutter/material.dart';
import 'package:mineudeka/model/author.dart';

final colorList = [
  Colors.deepPurpleAccent.shade100,
  Colors.indigoAccent.shade100,
  Colors.pinkAccent.shade100
];


class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  int currentPage = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: currentPage,
      keepPage: false,
      viewportFraction: 0.8,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            color: colorList[currentPage],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 400.0,
                child: PageView.builder(
                  itemBuilder: (context, index) {
                    return itemBuilder(index);
                  },
                  controller: _pageController,
                  pageSnapping: true,
                  onPageChanged: _onPageChanged,
                  itemCount: 3,
                  physics: ClampingScrollPhysics(),
                ),
              ),
              _detailsBuilder(currentPage),
            ],
          )
        ],
      ),
    );
  }

  Widget _detailsBuilder(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
        }

        return Expanded(
          child: Transform.translate(
            offset: Offset(0, 100 + (-value * 100)),
            child: Opacity(
              opacity: value,
              child: Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      authorList[index].name,
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.grey[200]),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      authorList[index].about,
                      style: TextStyle(fontSize: 14.0, color: Colors.grey[200]),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: 80.0,
                      height: 3.0,
                      color: Colors.grey[200],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    FlatButton.icon(
                      onPressed: (){},
                      label: Text(
                        "See Details",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w900, color: Colors.grey[200]),
                      ),
                      icon: Icon( Icons.arrow_forward_ios, color: Colors.grey[200] ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget itemBuilder(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
          return Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(
                    top: 20.0, left: 10.0, right: 10.0, bottom: 10.0),
                height: Curves.easeIn.transform(value) * 1000,
                child: child,
              ));
        } else {
          return Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(
                    left: 20.0, right: 10.0, bottom: 10.0),
                height:
                Curves.easeIn.transform(index == 0 ? value : value * 0.5) *
                    1000,
                child: child,
              ));
        }
      },
      child: Material(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0),
            ),
            child: Image.network(
              authorList[index].photos,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  _onPageChanged(int index) {
    setState(() {
      print(index);
      currentPage = index;
    });
  }
}
