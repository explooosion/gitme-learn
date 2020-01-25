import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Construct a color from a hex code string, of the format #RRGGBB.
Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

Future launchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print(url);
    // throw 'Could not launch $url';
  }
}
