import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/res/common_widgets/button_widget.dart';
import 'package:wizmo/view/onboarding/onboarding_provider.dart';

class MainOnBoarding extends StatefulWidget {
  MainOnBoarding({super.key});

  @override
  State<MainOnBoarding> createState() => _MainOnBoardingState();
}

class _MainOnBoardingState extends State<MainOnBoarding> {
  Widget circleBar(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 12 : 10,
      width: isActive ? 24 : 10,
      decoration: BoxDecoration(
          color: isActive ? AppColors.buttonColor : Colors.grey,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Consumer<OnBoardingProvider>(builder: (context, value, child) {
            return PageView.builder(
              physics: const ClampingScrollPhysics(),
              itemCount: value.pageList.length,
              onPageChanged: (page) {
                context
                    .read<OnBoardingProvider>()
                    .getChangedPageAndMoveBar(page);
              },
              controller: value.controller,
              itemBuilder: (context, index) {
                return value.pageList[index];
              },
            );
          }),
          Positioned(
            bottom: 55,
            left: 135,
            child:
                Consumer<OnBoardingProvider>(builder: (context, value, child) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  value.currentPageValue == 0
                      ? circleBar(true)
                      : circleBar(false),
                  value.currentPageValue == 1
                      ? circleBar(true)
                      : circleBar(false),
                  value.currentPageValue == 2
                      ? circleBar(true)
                      : circleBar(false),
                ],
              );
            }),
          ),
          Consumer<OnBoardingProvider>(
            builder: (context, value, child) {
              return value.currentPageValue == 2
                  ? SizedBox.shrink()
                  : Padding(
                      padding: EdgeInsets.symmetric(vertical: height * 0.03),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                            onPressed: () {
                              value.navigateToLast(2);
                            },
                            child: Text(
                              'Skip',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(color: AppColors.black),
                            )),
                      ));
            },
          ),
          Positioned(
            bottom: height * 0.14,
            child: Consumer<OnBoardingProvider>(
              builder: (context, value, child) {
                return ButtonWidget(
                    text: value.currentPageValue == 2 ? "Let's Start" : 'Next',
                    onTap: () {
                      context
                          .read<OnBoardingProvider>()
                          .navigateToLogin(context);
                    });
              },
            ),
          )
        ],
      ),
    );
  }
}
