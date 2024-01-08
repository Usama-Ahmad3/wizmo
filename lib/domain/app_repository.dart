import 'package:flutter/material.dart';

abstract class AppRepository {
  Future<dynamic> postWithImage(
      {required String url,
      required BuildContext context,
      required Map details});
  Future post(
      {required String url, required BuildContext context, Map? details});
}
