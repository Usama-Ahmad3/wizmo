import 'package:flutter/material.dart';

class Navigation {
  push(page, context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  pushRep(page, context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => page));
  }

  pop(context) {
    Navigator.pop(context);
  }
}
