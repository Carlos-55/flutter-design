import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonBold extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color colorOne;
  final Color colorTwo;
  final Function onPress;

  ButtonBold({
    this.icon = FontAwesomeIcons.question,
    @required this.text,
    @required this.onPress,
    this.colorOne = Colors.grey,
    this.colorTwo = Colors.blueGrey,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onPress,
      splashColor: this.colorOne,
      child: Stack(
        children: [
          _ButtonBoldBackground(
            icon: this.icon,
            colorOne: this.colorOne,
            colorTwo: this.colorTwo,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 140,
                width: 40,
              ),
              FaIcon(
                this.icon,
                color: Colors.white,
                size: 40,
              ),
              SizedBox(
                width: 40,
              ),
              Expanded(
                child: Text(
                  this.text,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              FaIcon(
                FontAwesomeIcons.chevronRight,
                color: Colors.white,
              ),
              SizedBox(
                width: 40,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _ButtonBoldBackground extends StatelessWidget {
  final IconData icon;
  final Color colorOne;
  final Color colorTwo;
  _ButtonBoldBackground(
      {this.icon,
      this.colorOne = Colors.grey,
      this.colorTwo = Colors.blueGrey});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
                right: -20,
                top: -20,
                child: FaIcon(
                  this.icon,
                  size: 150,
                  color: Colors.white.withOpacity(0.2),
                ))
          ],
        ),
      ),
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          // color: Colors.red,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(4, 6),
                blurRadius: 10)
          ],
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(colors: [this.colorOne, this.colorTwo])),
    );
  }
}
