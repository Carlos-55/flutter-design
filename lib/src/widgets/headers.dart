import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color colorOne;
  final Color colorTwo;

  IconHeader(
      {@required this.icon,
      @required this.title,
      @required this.subtitle,
      this.colorOne = Colors.grey,
      this.colorTwo = Colors.blueGrey});

  final Color colorWithe = Colors.white.withOpacity(0.7);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _IconHeaderBackground(
          colorOne: this.colorOne,
          colorTwo: this.colorTwo,
        ),
        Positioned(
            top: -50,
            left: -70,
            child: FaIcon(
              this.icon,
              size: 250,
              color: Colors.white.withOpacity(0.2),
            )),
        Column(
          children: [
            SizedBox(
              height: 80,
              width: double.infinity,
            ),
            Text(
              this.subtitle,
              style: TextStyle(color: colorWithe, fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              this.title,
              style: TextStyle(
                  color: colorWithe, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            FaIcon(
              this.icon,
              size: 80,
              color: Colors.white,
            )
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color colorOne;
  final Color colorTwo;

  const _IconHeaderBackground(
      {@required this.colorOne, @required this.colorTwo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [this.colorOne, this.colorTwo])),
    );
  }
}
