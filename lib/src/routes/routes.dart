import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

////===============================================
import 'package:pinterest/src/labs/slideshow.dart';
import 'package:pinterest/src/pages/emergency_page.dart';
import 'package:pinterest/src/pages/pinterest_page.dart';

final pageRoute = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'Slide Shore', SlideShowPage()),
  _Route(FontAwesomeIcons.ambulance, 'Emergency', EmergencyPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', PinterestPage()),
];

class _Route {
  final IconData icon;
  final String title;
  final Widget page;

  _Route(this.icon, this.title, this.page);
}