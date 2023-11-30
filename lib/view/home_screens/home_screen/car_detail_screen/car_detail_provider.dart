import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wizmo/utils/flushbar.dart';

class CarDetailProvider with ChangeNotifier {
  bool _viewMore = false;
  bool get viewMore => _viewMore;
  onClick() {
    _viewMore = !_viewMore;
    notifyListeners();
  }

  var isDialOpen = ValueNotifier<bool>(false);
  onTapSpeed() {
    isDialOpen.value = !isDialOpen.value;
    notifyListeners();
  }

  Future<void> launchInBrowser(String url, context) async {
    try {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } catch (e) {
      FlushBarUtils.flushBar(e.toString(), context, 'Could not launch $url');
    }
  }

  Future<void> makePhoneCall(String url, context) async {
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      FlushBarUtils.flushBar(e.toString(), context, 'Could not launch');
      print("Exception$e");
    }
  }
}
