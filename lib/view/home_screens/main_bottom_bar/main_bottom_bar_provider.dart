import 'package:flutter/cupertino.dart';
import 'package:wizmo/main.dart';
import 'package:wizmo/view/home_screens/account_screen/account_screen.dart';
import 'package:wizmo/view/home_screens/home_screen/home_initial_params.dart';
import 'package:wizmo/view/home_screens/home_screen/home_page.dart';
import 'package:wizmo/view/home_screens/save_screen/save_screen.dart';
import 'package:wizmo/view/home_screens/search_screen/search_screen.dart';
import 'package:wizmo/view/home_screens/sell_screen/sell_screen.dart';

class MainBottomBarProvider extends ChangeNotifier {
  final page = [
    HomePage(
        initialParams:
            HomeInitialParams(detail: {}, provider: getIt(), name: 'Usama')),
    const SearchScreen(),
    const SellScreen(),
    const SaveScreen(),
    const AccountScreen(),
  ];
  int _initialIndex = 0;
  int get initialIndex => _initialIndex;
  pageChange(int index) {
    _initialIndex = index;
    notifyListeners();
  }
}
