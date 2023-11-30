import 'package:flutter/cupertino.dart';

class SaveProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  onRefresh() {
    _loading = true;
    notifyListeners();
    Future.delayed(const Duration(seconds: 2), () {
      _loading = false;
      notifyListeners();
    });
  }
}
