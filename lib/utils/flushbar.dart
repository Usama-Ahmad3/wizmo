import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class FlushBarUtils {
  static Future flushBar(
      String message, BuildContext context, String title) async {
    await Flushbar(
      borderRadius: BorderRadius.circular(20),
      animationDuration: const Duration(seconds: 1),
      padding: const EdgeInsets.all(15),
      dismissDirection: FlushbarDismissDirection.VERTICAL,
      barBlur: 20,
      titleColor: Colors.black,
      reverseAnimationCurve: Curves.easeInQuint,
      progressIndicatorBackgroundColor: Colors.cyanAccent,
      messageColor: Colors.black,
      boxShadows: const [
        BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(1, 1),
            blurStyle: BlurStyle.normal)
      ],
      margin: const EdgeInsets.all(25),
      backgroundColor: Colors.transparent,
      flushbarStyle: FlushbarStyle.FLOATING,
      flushbarPosition: FlushbarPosition.TOP,
      title: title,
      message: message,
      duration: const Duration(seconds: 3),
    ).show(context);
  }
}
