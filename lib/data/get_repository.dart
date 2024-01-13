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
  Future postWithImage(
      {required String url,
      required BuildContext context,
      required Map details}) async {
    print('Post With Image');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var apiUrl = Uri.parse(url);
      var client = http.Client();
      var request = http.MultipartRequest('POST', apiUrl);

      details.forEach((key, value) {
        if (value is String) {
          request.fields[key] = value;
        }
      });

      if (details['listFile'] == false) {
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
      } else {
        request.headers['Authorization'] = "Bearer ${prefs.getString('token')}";
        for (int i = 0; i < details['car_images'].length; i++) {
          var file = http.MultipartFile(
            'car_images[$i]',
            details['car_images'][i].readAsBytes().asStream(),
            details['car_images'][i].lengthSync(),
            filename: 'car_image_$i.jpg',
            contentType: MediaType('image', 'jpeg'),
          );
          request.files.add(file);
        }
      }
      var response = await client.send(request);
      print("response ${response.stream.isBroadcast}");
      print(response.statusCode);
      print(url);
      // print(await response.stream.bytesToString());
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
    print('Post Without Image');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var response;
      if (details != null) {
        print(prefs.getString('token'));
        response = await http.post(Uri.parse(url), body: details, headers: {
          "Authorization": "Bearer ${prefs.getString('token')}",
        });
      } else {
        print(prefs.getString('token'));
        print(url);
        response = await http.post(Uri.parse(url), headers: {
          "Authorization": "Bearer ${prefs.getString('token')}",
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

  @override
  Future get({required url, required BuildContext context, String? id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      print(prefs.getString('token'));
      print(url);
      if (id != null) {
        url = '$url/$id';
      }
      final response = await http.get(Uri.parse(url), headers: {
        "Authorization": "Bearer ${prefs.getString('token')}",
      });
      print(response.statusCode);
      print(response.body);
      print(url);
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        print("object$body");
        return body;
      } else if (response.statusCode == 404) {
        return null;
      } else {
        // ignore: use_build_context_synchronously
        Exceptions().exceptionsMessages(response.statusCode, context);
      }
    } catch (e) {
      print('Error Hai Bro:$e');
    }
  }
}
