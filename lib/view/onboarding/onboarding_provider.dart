import 'package:flutter/material.dart';
import 'package:wizmo/res/routes/route_name.dart';

import 'first.dart';
import 'second.dart';
import 'third.dart';

class OnBoardingProvider extends ChangeNotifier {
  int _currentPageValue = 0;
  final pageList = [
    const FirstScreen(),
    const SecondScreen(),
    const ThirdScreen()
  ];
  PageController controller = PageController(initialPage: 0);
  int get currentPageValue => _currentPageValue;
  void getChangedPageAndMoveBar(int page) {
    _currentPageValue = page;
    notifyListeners();
  }

  navigateToLast(int page) {
    controller.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.bounceInOut);
    _currentPageValue = page;
    notifyListeners();
  }

  navigateToLogin(BuildContext context) {
    if (currentPageValue == 2) {
      Navigator.pushReplacementNamed(context, RouteName.login);
    } else {
      _currentPageValue += 1;
      navigateToLast(currentPageValue);
      notifyListeners();
    }
  }
}
