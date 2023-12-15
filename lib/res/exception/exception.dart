import 'package:flutter/material.dart';
import 'package:wizmo/utils/flushbar.dart';

class Exceptions {
  void exceptionsMessages(int statusCode, BuildContext context) {
    switch (statusCode) {
      case 401:
        FlushBarUtils.flushBar('Wrong Credentials', context, 'Error');
        break;
      case 404:
        FlushBarUtils.flushBar('User Not Found', context, "Error");
        break;
      case 500:
        FlushBarUtils.flushBar('Server Down', context, "Error");
        break;
      default:
        FlushBarUtils.flushBar('Server Down', context, "Error");
        break;
    }
  }
}
