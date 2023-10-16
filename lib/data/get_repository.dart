import 'dart:convert';

import 'package:flutter/material.dart' show BuildContext;
import 'package:wizmo/domain/app_repository.dart';
import 'package:http/http.dart' as http;
import 'package:wizmo/models/model.dart';

class GetRepository implements AppRepository {
  @override
  Future get(String url, BuildContext context) async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var list = jsonDecode(response.body) as List;
      return list.map((e) => UserJson.fromJson(e)).toList();
    }
  }
}
