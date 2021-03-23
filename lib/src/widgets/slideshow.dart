import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class SlideShow extends StatelessWidget {
  final List<Widget> slides;
  final bool dotsUpping;
  final Color primaryColor;
  final Color secondaryColor;
  final double bulletPrimary;
  final double bulletSecondary;

  SlideShow(
      {@required this.slides,
      this.dotsUpping = false,
      this.primaryColor = Colors.pink,
      this.secondaryColor = Colors.grey,
      this.bulletPrimary = 12,
      this.bulletSecondary = 12});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _SlideShowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              Provider.of<_SlideShowModel>(context).primaryColor =
                  this.primaryColor;
              Provider.of<_SlideShowModel>(context).secondaryColor =
                  this.secondaryColor;
              Provider.of<_SlideShowModel>(context).bulletPrimary =
                  this.bulletPrimary;
              Provider.of<_SlideShowModel>(context).bulletSecondary =
                  this.bulletSecondary;

              return _CreateStructure(dotsUpping: dotsUpping, slides: slides);
            },
          ),
        ),
      ),
    );
  }
}

class _CreateStructure extends StatelessWidget {
  const _CreateStructure({
    Key key,
    @required this.dotsUpping,
    @required this.slides,
  }) : super(key: key);

  final bool dotsUpping;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (this.dotsUpping) _DotsDown(this.slides.length),
        Expanded(child: _Slides(this.slides)),
        if (!this.dotsUpping) _DotsDown(this.slides.length),
      ],
    );
  }
}

//Contenedor que se muestra en el SlideShow
class _Slides extends StatefulWidget {
  final List<Widget> slides;
  _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();
  final int count = 0;
  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      //aqui de actualiza el provider del slide
      Provider.of<_SlideShowModel>(context, listen: false).currentPage =
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
      children: widget.slides.map((slide) => _Slide(slide)).toList(),
    ));
  }
}

//Widget para mostrar las imagenes svg
class _Slide extends StatelessWidget {
  final Widget slide;
  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(30),
        child: slide);
  }
}

//Diseno de los puntos de la parte inferior
class _DotsDown extends StatelessWidget {
  final int count;
  _DotsDown(this.count);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      // color: Colors.red,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          //List.generate nos permite generar como un for pero nativo
          children: List.generate(this.count, (i) => _Dot(i))),
    );
  }
}

//Widget de lod puntos
class _Dot extends StatelessWidget {
  final int index;

  _Dot(this.index);
  @override
  Widget build(BuildContext context) {
    final ssModel = Provider.of<_SlideShowModel>(context);
    double sizePrimary;
    Color color;
    if (ssModel.currentPage >= index - 0.5 &&
        ssModel.currentPage < index + 0.5) {
      sizePrimary = ssModel._bulletPrimary;
      color = ssModel.primaryColor;
    } else {
      sizePrimary = ssModel._bulletSecondary;
      color = ssModel.secondaryColor;
    }
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.ease,
      width: sizePrimary,
      height: sizePrimary,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _SlideShowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _primaryColor = Colors.blue;
  Color _secondaryColor = Colors.grey;
  double _bulletPrimary = 12;
  double _bulletSecondary = 12;

  double get currentPage => this._currentPage;

  set currentPage(double valuePage) {
    this._currentPage = valuePage;
    notifyListeners();
  }

  Color get primaryColor => this._primaryColor;

  set primaryColor(Color valuePrimaryColor) {
    this._primaryColor = valuePrimaryColor;
  }

  Color get secondaryColor => this._secondaryColor;

  set secondaryColor(Color valueSecondaryColor) {
    this._secondaryColor = valueSecondaryColor;
  }

  double get bulletPrimary => this._bulletPrimary;

  set bulletPrimary(double bulletPrimary) {
    this._bulletPrimary = bulletPrimary;
  }

  double get bulletSecondary => this._bulletSecondary;

  set bulletSecondary(double bulletSecondary) {
    this._bulletSecondary = bulletSecondary;
  }
}
