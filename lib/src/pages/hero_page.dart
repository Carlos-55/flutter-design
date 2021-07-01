import 'package:flutter/material.dart';

class HeroPageAnimated extends StatelessWidget {
  const HeroPageAnimated({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 20.0,
            ),
            ListTile(
              leading: GestureDetector(
                onTap: () => _showSecondPage(context),
                child: const Hero(
                  tag: 'my-hero-animation-tag',
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/img/astronauta.jpg'),
                  ),
                ),
              ),
              title: const Text(
                  'Tap on the photo to view the animation transition.'),
            ),
          ],
        ),
      ),
    );
  }

  void _showSecondPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => Scaffold(
          body: Center(
            child: Hero(
              tag: 'my-hero-animation-tag',
              child: Image.asset('assets/img/astronauta.jpg'),
            ),
          ),
        ),
      ),
    );
  }
}
