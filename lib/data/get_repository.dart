import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart' show BuildContext;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wizmo/domain/app_repository.dart';
import 'package:http/http.dart' as http;
import 'package:wizmo/res/exception/exception.dart';
import 'package:wizmo/utils/flushbar.dart';

class GetRepository implements AppRepository {
  @override
  Future signup(
      {required String url,
      required BuildContext context,
      required Map details}) async {
    try {
      var apiUrl = Uri.parse(url);
      var client = http.Client();
      var request = http.MultipartRequest('POST', apiUrl);

      details.forEach((key, value) {
        if (value is String) {
          request.fields[key] = value;
        }
      });

      if (details['profile_image'] is File) {
        print('file');
        var file = http.MultipartFile(
          'profile_image',
          details['profile_image'].readAsBytes().asStream(),
          details['profile_image'].lengthSync(),
          filename: 'profile_image.jpg',
          contentType:
              MediaType('image', 'jpeg'), // Adjust content type as needed
        );
        request.files.add(file);
        print(request.files);
      }
      var response = await client.send(request);
      print("response ${response.stream.isBroadcast}");
      print(response.statusCode);
      print(url);
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        return responseBody;
      } else if (response.statusCode == 302) {
        var redirectUrl = response.headers['location'];
        print('Redirect URL: $redirectUrl');
        // ignore: use_build_context_synchronously
        await FlushBarUtils.flushBar(
            'Looks like email already registered', context, "Error");
      } else {
        print('Signup failed with status ${response.statusCode}');
        // ignore: use_build_context_synchronously
        Exceptions().exceptionsMessages(response.statusCode, context);
      }
      client.close();
    } catch (error) {
      print('Error during signup: $error');
    }
  }

  @override
  Future post(
      {required String url,
      required BuildContext context,
      Map? details}) async {
    print(details);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var response;
      if (details != null) {
        response = await http.post(Uri.parse(url), body: details, headers: {
          "Authorization": "Bearer ${prefs.getString('token')}",
        });
      } else {
        print(prefs.getString('token'));
        response = await http.post(Uri.parse(url), headers: {
          "Authorization": "Bearer ${prefs.getString('token')}",
          'Content-Type': 'application/json',
        });
      }
      print(response.statusCode);
      print(response.body);
      print(url);
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        print("object$body");
        return body;
      } else {
        // ignore: use_build_context_synchronously
        Exceptions().exceptionsMessages(response.statusCode, context);
      }
    } catch (e) {
      print('Error Hai Bro:$e');
    }
  }
}
