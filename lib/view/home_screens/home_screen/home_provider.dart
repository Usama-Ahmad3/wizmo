import 'package:flutter/material.dart';
import 'package:wizmo/domain/app_repository.dart';
import 'package:wizmo/utils/flushbar.dart';

class HomeProvider extends ChangeNotifier {
  AppRepository appRepository;
  HomeProvider({required this.appRepository});
  flushBarUtils(String msg, BuildContext context, String title) {
    FlushBarUtils.flushBar(msg, context, title);
  }
  get(String url, BuildContext context) async {
    await appRepository.get(url, context);
  }
}
