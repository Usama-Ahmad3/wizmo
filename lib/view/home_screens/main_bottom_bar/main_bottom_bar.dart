import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/view/home_screens/main_bottom_bar/main_bottom_bar_provider.dart';

class MainBottomBar extends StatefulWidget {
  const MainBottomBar({super.key});

  @override
  State<MainBottomBar> createState() => _MainBottomBarState();
}

class _MainBottomBarState extends State<MainBottomBar> {
  @override
  Widget build(BuildContext context) {
    print('hi');
    return Consumer<MainBottomBarProvider>(builder: (context, value, child) {
      return Scaffold(
        bottomNavigationBar: ConvexAppBar(
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
          initialActiveIndex: value.initialIndex,
          onTap: (index) {
            context.read<MainBottomBarProvider>().pageChange(index);
          },
        ),
        body: value.page[value.initialIndex],
      );
    });
  }
}
