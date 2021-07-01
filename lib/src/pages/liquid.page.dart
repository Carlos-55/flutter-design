import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

// import 'dart:math';
// import 'package:liquid_swipe/liquid_swipe.dart';

class LiquidPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidSwipe(
        pages: [
          Container(
            color: Colors.pink,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset(
                  'assets/img/img1.png',
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height / 2,
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "Hi",
                    ),
                    Text(
                      "It's Me",
                    ),
                    Text(
                      "Sahdeep",
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.deepPurpleAccent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset(
                  'assets/img/astronauta.jpg',
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "Take a",
                    ),
                    Text(
                      "look at",
                    ),
                    Text(
                      "Liquid Swipe",
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.greenAccent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset(
                  'assets/img/imagen2.jpg',
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "Liked?",
                    ),
                    Text(
                      "Fork!",
                    ),
                    Text(
                      "Give Star!",
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.yellowAccent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset(
                  'assets/img/imagen3.jpg',
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "Can be",
                    ),
                    Text(
                      "Used for",
                    ),
                    Text(
                      "Onboarding Design",
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.yellowAccent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  child: Image.asset(
                    'assets/img/imagen3.jpg',
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      dataImage(context, 'assets/img/imagen3.jpg');
                    }));
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showSecondPage(BuildContext context, String url) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => Scaffold(
          body: Center(
            child: Hero(
              tag: 'nuevo-tag',
              child: Image.asset(url),
            ),
          ),
        ),
      ),
    );
  }

  void dataImage(BuildContext context, String url) async {
    // await Future.delayed(Duration(seconds: 2), () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => Scaffold(
          body: Center(
            child: Image.asset(url),
          ),
        ),
      ),
    );
    // });
  }
}
