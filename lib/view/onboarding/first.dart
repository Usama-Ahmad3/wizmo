import 'package:flutter/material.dart';
import 'package:wizmo/res/common_widgets/cashed_image.dart';
import 'package:wizmo/view/onboarding/onboarding_widgets.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            cachedNetworkImage(
                cuisineImageUrl:
                    'https://clipart-library.com/images/XpcoqGLTE.png',
                height: height * 0.4,
                imageFit: BoxFit.fill,
                errorFit: BoxFit.contain,
                width: width),
            SizedBox(
              height: height * 0.04,
            ),
            TextWidget(
              context,
              height,
              width,
              'Welcome to Wizmo' /*title*/,
              'Experience of better way of buying and selling' /*subtitle1*/,
              '' /*subtitle2*/,
              'Get offer from dealers and sell your car fast or' /*text1*/,
              'view your current offers' /*text21*/,
            ),
            SizedBox(
              height: height * 0.09,
            ),
          ],
        ),
      ),
    );
  }
}
