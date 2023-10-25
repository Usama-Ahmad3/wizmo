import 'package:flutter/material.dart';

class NavigatorClass {
  navigatorPush(page, context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  navigatorPushReplacment(page, context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => page));
  }

  navigatorPop(context) {
    Navigator.pop(context);
  }
}
