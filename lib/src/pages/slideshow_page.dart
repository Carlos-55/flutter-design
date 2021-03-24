import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinterest/src/widgets/slideshow.dart';

class SlidesShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(child: _MySlideShow()),
        Expanded(child: _MySlideShow()),
      ],
    ));
  }
}

class _MySlideShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SlideShow(
      slides: [
        SvgPicture.asset('assets/svg/slide-1.svg'),
        SvgPicture.asset('assets/svg/slide-2.svg'),
        SvgPicture.asset('assets/svg/slide-3.svg'),
        SvgPicture.asset('assets/svg/slide-2.svg'),
        SvgPicture.asset('assets/svg/slide-3.svg')
      ],
      // dotsUpping: ,
      primaryColor: Colors.red,
      secondaryColor: Colors.red[200],
      bulletPrimary: 16,
      bulletSecondary: 12,
    );
  }
}
