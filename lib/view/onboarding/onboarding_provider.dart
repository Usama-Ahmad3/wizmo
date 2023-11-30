import 'package:flutter/material.dart';
import 'package:wizmo/main.dart';
import 'package:wizmo/utils/navigator_class.dart';
import 'package:wizmo/view/login_signup/login/login.dart';

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
      Navigation().pushRep(LogIn(provider: getIt()), context);
    } else {
      _currentPageValue += 1;
      navigateToLast(currentPageValue);
      notifyListeners();
    }
  }
}
