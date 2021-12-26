import 'package:flutter/material.dart';

class NavUtil {
  static void navigateTo(BuildContext context, Widget destination,
      {bool replacement = false}) {
    MaterialPageRoute route =
        MaterialPageRoute(builder: (context) => destination);
    if (replacement) {
      Navigator.pushReplacement(context, route);
    } else {
      Navigator.push(context, route);
    }
  }
}
