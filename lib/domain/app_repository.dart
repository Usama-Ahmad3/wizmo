import 'package:flutter/material.dart';

abstract class AppRepository {
  Future<dynamic> get(String url, BuildContext context);
}
