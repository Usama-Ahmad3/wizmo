import 'package:flutter/material.dart';
import 'package:wizmo/res/common_widgets/cashed_image.dart';
import 'package:wizmo/view/onboarding/onboarding_widgets.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height * 0.1,
          ),
          cachedNetworkImage(
              cuisineImageUrl:
                  'https://tse4.mm.bing.net/th?id=OIP.cgzfayHlKYHpbDGUNuKfgQHaD0&pid=Api&P=0&h=220',
              height: height * 0.4,
              imageFit: BoxFit.fill,
              errorFit: BoxFit.fill,
              width: width),
          SizedBox(
            height: height * 0.04,
          ),
          TextWidget(
            context,
            height,
            width,
            'Bargain like a shark' /*title*/,
            "Sell your vehicle on Wizmo! it's easy and free" /*subtitle1*/,
            '' /*subtitle2*/,
            'Safety buy vehicle online, read how to protect' /*text1*/,
            'yourself view your current offers' /*text2*/,
          )
        ],
      ),
    );
  }
}
