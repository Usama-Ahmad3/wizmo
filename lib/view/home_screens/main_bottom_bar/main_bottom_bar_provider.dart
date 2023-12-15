import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wizmo/main.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/view/home_screens/account_screen/account_screen.dart';
import 'package:wizmo/view/home_screens/home_screen/home_initial_params.dart';
import 'package:wizmo/view/home_screens/home_screen/home_page.dart';
import 'package:wizmo/view/home_screens/save_screen/save_screen.dart';
import 'package:wizmo/view/home_screens/search_screen/search_screen.dart';
import 'package:wizmo/view/home_screens/sell_screen/sell_screen/sell_screen.dart';

class MainBottomBarProvider extends ChangeNotifier {
  MainBottomBarProvider({Key? key});
  final page = [
    HomePage(
        initialParams: HomeInitialParams(
      provider: getIt(),
    )),
    const SearchScreen(),
    SellScreen(
      provider: getIt(),
    ),
    const SaveScreen(),
    AccountScreen(provider: getIt()),
  ];
  int _initialIndex = 0;
  int get initialIndex => _initialIndex;
  pageChange(int index) {
    _initialIndex = index;
    notifyListeners();
  }

  onWillPop(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 2,
            backgroundColor: AppColors.grey200,
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            title: Text(
              "Are you Sure",
              style: TextStyle(color: AppColors.black),
            ),
            content: Text(
              "You're going to exit",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: AppColors.red),
            ),
            actions: [
              InkWell(
                  onTap: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Center(
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.buttonColor,
                      ),
                      child: Center(
                        child: Text(
                          'No',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: AppColors.white),
                        ),
                      ),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  // Navigator.of(context).pop(true);
                  exit(0);
                },
                child: Center(
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.buttonColor,
                      border: Border.all(width: 1, color: AppColors.white),
                    ),
                    child: Center(
                      child: Text(
                        'Yes',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
