import 'package:flutter/material.dart';
import 'package:wizmo/res/colors/app_colors.dart';

class AppBarWidget extends StatelessWidget {
  Size size;
  String title;
  Color color1;
  Color color2;
  AppBarWidget(
      {super.key,
      required this.size,
      required this.color1,
      required this.color2,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: AppColors.black),
        ),
        bottom: PreferredSize(
          preferredSize: Size(size.width * 0.9, size.height * 0.005),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width * 0.05,
              ),
              Container(
                height: size.height * 0.005,
                width: size.width * 0.2,
                color: AppColors.buttonColor,
              ),
              SizedBox(
                width: size.width * 0.01,
              ),
              Container(
                height: size.height * 0.005,
                width: size.width * 0.2,
                color: color1,
              ),
              SizedBox(
                width: size.width * 0.01,
              ),
              Container(
                height: size.height * 0.005,
                width: size.width * 0.2,
                color: color2,
              ),
            ],
          ),
        ));
  }
}
