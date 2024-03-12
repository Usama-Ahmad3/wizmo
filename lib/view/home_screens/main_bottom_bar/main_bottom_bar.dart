import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizmo/main.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/view/home_screens/account_screen/account_screen.dart';
import 'package:wizmo/view/home_screens/home_screen/home_initial_params.dart';
import 'package:wizmo/view/home_screens/home_screen/home_page.dart';
import 'package:wizmo/view/home_screens/main_bottom_bar/main_bottom_bar_provider.dart';
import 'package:wizmo/view/home_screens/save_screen/save_screen.dart';
import 'package:wizmo/view/home_screens/search_screen/search_screen.dart';
import 'package:wizmo/view/home_screens/sell_screen/sell_screen/sell_screen.dart';

// ignore: must_be_immutable
class MainBottomBar extends StatefulWidget {
  int index;
  final MainBottomBarProvider provider;
  MainBottomBar({super.key, this.index = 0, required this.provider});

  @override
  State<MainBottomBar> createState() => _MainBottomBarState();
}

class _MainBottomBarState extends State<MainBottomBar> {
  @override
  void initState() {
    _initialIndex = widget.index;
    super.initState();
  }

  int _initialIndex = 0;
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
  pageChange(int index) {
    _initialIndex = index;
    widget.index = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var authProvider =
        Provider.of<MainBottomBarProvider>(context, listen: false);
    return WillPopScope(
      onWillPop: () {
        return authProvider.popupDialog(
            buttonText: 'Yes', text: "You're going to exit", context: context);
      },
      child: Scaffold(
        bottomNavigationBar: ConvexAppBar(
          curve: Curves.bounceInOut,
          disableDefaultTabController: false,
          items: const [
            TabItem(
              icon: Icons.home_outlined,
              activeIcon: Icons.home,
              title: 'Home',
            ),
            TabItem(
                icon: Icons.search, title: 'Search', activeIcon: Icons.search),
            TabItem(
                icon: Icons.sell_outlined,
                title: 'Sell',
                activeIcon: Icons.sell),
            TabItem(
                icon: Icons.favorite_border,
                activeIcon: Icons.favorite,
                title: 'Saved'),
            TabItem(
                icon: Icons.account_circle_outlined,
                title: 'Account',
                activeIcon: Icons.account_circle)
          ],
          backgroundColor: AppColors.buttonColor,
          style: TabStyle.react,
          initialActiveIndex: _initialIndex,
          onTap: (index) {
            pageChange(index);
          },
        ),
        body: page[_initialIndex],
      ),
    );
  }
}
