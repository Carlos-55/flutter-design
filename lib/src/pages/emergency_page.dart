import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pinterest/src/widgets/button_bold.dart';
import 'package:pinterest/src/widgets/headers.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = <ItemBoton>[
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
    ];

    List<Widget> buttonList = items
        .map((props) => FadeInLeft(
              duration: Duration(seconds: 1),
              child: ButtonBold(
                onPress: () {
                  print('Accion 1');
                },
                text: props.texto,
                colorOne: props.color1,
                colorTwo: props.color2,
                icon: props.icon,
              ),
            ))
        .toList();
    return Scaffold(
      body: Stack(children: [
        Container(
          margin: EdgeInsets.only(top: 200),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 80,
              ),
              ...buttonList
            ],
          ),
        ),
        _HeaderWithButton()
      ]),
    );
  }
}

class _HeaderWithButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
          icon: FontAwesomeIcons.plus,
          title: 'Asistencia Medica',
          subtitle: 'Haz solicitado',
          colorOne: Color(0xff536CF6),
          colorTwo: Color(0xff66A9F2),
        ),
        Positioned(
          top: 40,
          right: -20,
          child: RawMaterialButton(
              onPressed: () {},
              shape: CircleBorder(),
              padding: EdgeInsets.all(15.0),
              child: FaIcon(
                FontAwesomeIcons.ellipsisV,
                color: Colors.white,
              )),
        ),
        SafeArea(
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
          ),
        )
      ],
    );
  }
}

class BoldButtom extends StatelessWidget {
  const BoldButtom({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBold(
      onPress: () {
        print('Accion 1');
      },
      text: 'Titulo 1',
      colorOne: Color(0xff6989F5),
      colorTwo: Color(0xff906EF5),
      icon: FontAwesomeIcons.carCrash,
    );
  }
}

class _PageHeader extends StatelessWidget {
  const _PageHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plus,
      subtitle: 'Haz solicitado',
      title: 'Asistencia medica',
      colorOne: Color(0xff526BF6),
      colorTwo: Color(0xff67ACF2),
    );
  }
}
