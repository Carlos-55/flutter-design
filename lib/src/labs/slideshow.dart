import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinterest/src/models/slider_model.dart';
import 'package:provider/provider.dart';

class SlideShowPage extends StatelessWidget {
  const SlideShowPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new SliderModel(),
      child: Scaffold(
        body: Column(
          children: [Expanded(child: _Slides()), _DotsDown()],
        ),
      ),
    );
  }
}

//Contenedor que se muestra en el SlideShow
class _Slides extends StatefulWidget {
  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();
  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      //aqui de actualiza el provider del slide
      Provider.of<SliderModel>(context, listen: false).currentPage =
          pageViewController.page;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: PageView(
      controller: pageViewController,
      children: [
        _Slide('assets/svg/slide-1.svg'),
        _Slide('assets/svg/slide-2.svg'),
        _Slide('assets/svg/slide-3.svg'),
      ],
    ));
  }
}

//Widget para mostrar las imagenes svg
class _Slide extends StatelessWidget {
  final String svg;
  _Slide(this.svg);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: SvgPicture.asset(this.svg, semanticsLabel: 'Acme Logo'),
    );
  }
}

//Diseno de los puntos de la parte inferior
class _DotsDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      // color: Colors.red,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center, children: positionDot()),
    );
  }

  //Descomentar cuando se tenga un array y el index de las imagenes
  List<Widget> positionDot() {
    List<Widget> array = [];
    for (var i = 0; i < 3; i++) {
      array.add(_Dot(i));
    }
    return array;
  }
}

//Widget de lod puntos
class _Dot extends StatelessWidget {
  final int index;
  _Dot(this.index);
  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInCirc,
      width: 12,
      height: 12,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5)
              ? Colors.pink
              : Colors.grey,
          shape: BoxShape.circle),
    );
  }
}
