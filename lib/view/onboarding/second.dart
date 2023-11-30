import 'package:flutter/material.dart';
import 'package:wizmo/res/common_widgets/cashed_image.dart';
import 'package:wizmo/view/onboarding/onboarding_widgets.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            cachedNetworkImage(
                cuisineImageUrl:
                    'https://tse2.mm.bing.net/th?id=OIP.Tmt44ndHqXvyTP4XHbQm4wHaFj&pid=Api&P=0&h=220',
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
              'Buy and Sell cars' /*title*/,
              "You don't have to be a mechanic to make " /*subtitle1*/,
              'a little money on used cars' /*subtitle2*/,
              'selling Cars at Their Highest Value!' /*text1*/,
              '' /*text2*/,
            )
          ],
        ),
      ),
    );
  }
}
