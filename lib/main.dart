import 'package:flutter/material.dart';
import 'package:pinterest/src/pages/slideshow_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App desing',
        home: SlidesShowPage());
  }
}
