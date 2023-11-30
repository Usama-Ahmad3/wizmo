import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/res/common_widgets/cashed_image.dart';

import '../home_provider.dart';

class CarContainer extends StatelessWidget {
  List image;
  String price;
  String model;
  String name;
  bool isFavourite;
  VoidCallback onTap;
  CarContainer(
      {super.key,
      required this.image,
      required this.price,
      required this.name,
      this.isFavourite = false,
      required this.onTap,
      required this.model});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.05, vertical: height * 0.012),
      child: Container(
        height: height * 0.3,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(height * 0.01),
            boxShadow: [
              BoxShadow(
                  color: AppColors.shadowColor.withOpacity(0.17),
                  blurStyle: BlurStyle.normal,
                  offset: const Offset(1, 1),
                  blurRadius: 12,
                  spreadRadius: 2)
            ],
            color: AppColors.white),
        child: Stack(
          children: [
            Consumer<HomeProvider>(builder: (context, value, child) {
              return CarouselSlider.builder(
                  itemCount: image.length,
                  itemBuilder: (context, index, realIndex) {
                    return InkWell(
                      onTap: onTap,
                      child: Column(
                        children: [
                          SizedBox(
                              height: height * 0.23,
                              width: width,
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(height * 0.01),
                                child: cachedNetworkImage(
                                    height: height * 0.23,
                                    width: width,
                                    cuisineImageUrl: image[index],
                                    imageFit: BoxFit.fill,
                                    errorFit: BoxFit.contain),
                              )),
                        ],
                      ),
                    );
                  },
                  carouselController: value.nextPageController,
                  options: CarouselOptions(
                      autoPlay: true,
                      autoPlayCurve: Curves.easeInOut,
                      onPageChanged: (index, reason) {
                        context.read<HomeProvider>().onChangeCorousel(index);
                      },
                      height: height,
                      viewportFraction: 1,
                      animateToClosest: true,
                      initialPage: value.initialPage,
                      scrollDirection: Axis.horizontal,
                      scrollPhysics: const AlwaysScrollableScrollPhysics()));
            }),
            Positioned(
              top: height * 0.2,
              left: 0.0,
              right: 0.0,
              child: Consumer<HomeProvider>(builder: (context, value, child) {
                return DotsIndicator(
                  dotsCount: image.length,
                  position: value.initialPage.toInt(),
                  decorator: DotsDecorator(
                    activeSize: Size(width * 0.05, height * 0.01),
                    color: AppColors.grey,
                    activeColor: AppColors.buttonColor,
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                );
              }),
            ),
            Positioned(
              bottom: height * 0.02,
              left: height * 0.009,
              right: height * 0.009,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: AppColors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    price,
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: AppColors.red),
                  ),
                ],
              ),
            ),
            Positioned(
              top: height * 0.01,
              left: width * 0.03,
              child: Container(
                height: height * 0.03,
                width: width * 0.17,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(height * 0.008),
                    color: AppColors.grey.withOpacity(0.65),
                    shape: BoxShape.rectangle),
                child: Center(
                    child: Text(
                  model,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: AppColors.white),
                )),
              ),
            ),
            Positioned(
                right: width * 0.02,
                top: height * 0.009,
                child: CircleAvatar(
                  backgroundColor: AppColors.grey.withOpacity(0.65),
                  radius: height * 0.021,
                  child: Icon(
                    Icons.star,
                    color: isFavourite ? AppColors.blue : AppColors.white,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget TextWidget(
  String text,
  BuildContext context,
  double width,
) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: width * 0.02),
    child: Text(
      text,
      style: Theme.of(context)
          .textTheme
          .headline4!
          .copyWith(color: AppColors.black, fontWeight: FontWeight.bold),
    ),
  );
}
