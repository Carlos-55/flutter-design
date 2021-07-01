import 'dart:math';

import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class LiquidSlide extends StatefulWidget {
  final List<Widget> pages = [];

  @override
  _LiquidSlide createState() => _LiquidSlide(pages: pages);
}

class _LiquidSlide extends State<LiquidSlide> {
  final List<dynamic> pages = [];

  int page = 0;
  LiquidController liquidController;
  UpdateType updateType;

  _LiquidSlide({@required pages});

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            LiquidSwipe(
              pages: pages,
              positionSlideIcon: 0.18,
              slideIconWidget: Icon(Icons.arrow_back_ios),
              onPageChangeCallback: pageChangeCallback,
              waveType: WaveType.liquidReveal,
              liquidController: liquidController,
              ignoreUserGestureWhileAnimating: true,
            ),
          ],
        ),
      ),
    );
  }

  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }
}
