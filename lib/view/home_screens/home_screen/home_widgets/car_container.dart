import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizmo/res/app_urls/app_urls.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/res/common_widgets/cashed_image.dart';
import 'package:wizmo/view/home_screens/Favourites_Screens/favourites_provider.dart';

import '../home_provider.dart';

class CarContainer extends StatelessWidget {
 final List image;
 final String price;
 final String model;
 final String name;
 final bool isFavourite;
 final bool admin;
 final String carId;
 final VoidCallback onTap;
 const CarContainer(
      {super.key,
     required this.carId,
      required this.image,
      required this.price,
      this.admin = false,
      required this.name,
      this.isFavourite = false,
      required this.onTap,
      required this.model});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // final provider = Provider.of<CarFavouritesProvider>(context,listen: false);
    // provider.favouriteCarsGet(context: context,url: '${AppUrls.baseUrl}${AppUrls.getSavedCars}');
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
        child: Consumer<CorouselProvider>(
          builder: (context, value, child) {
            return Stack(
              children: [
                CarouselSlider.builder(
                    itemCount: image.length,
                    itemBuilder: (context, index, realIndex) {
                      return InkWell(
                        onTap: onTap,
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.23,
                              width: width,
                              child: admin
                                  ? Banner(
                                      location: BannerLocation.topStart,
                                      layoutDirection: TextDirection.rtl,
                                      message: 'Approved By Admin',
                                      color: Colors.red,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            height * 0.01),
                                        child: cachedNetworkImage(
                                            height: height * 0.23,
                                            width: width,
                                            cuisineImageUrl: image[index] ?? '',
                                            imageFit: BoxFit.fill,
                                            errorFit: BoxFit.contain),
                                      ),
                                    )
                                  : ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(height * 0.01),
                                      child: cachedNetworkImage(
                                          height: height * 0.23,
                                          width: width,
                                          cuisineImageUrl: image[index] ?? '',
                                          imageFit: BoxFit.fill,
                                          errorFit: BoxFit.fill),
                                    ),
                            ),
                          ],
                        ),
                      );
                    },
                    carouselController: value.nextPageController,
                    options: CarouselOptions(
                        autoPlay: true,
                        autoPlayCurve: Curves.easeInOut,
                        onPageChanged: (index, reason) {
                          value.onChangeCorousel(index);
                        },
                        height: height,
                        viewportFraction: 1,
                        animateToClosest: true,
                        initialPage: value.initialPage,
                        scrollDirection: Axis.horizontal,
                        scrollPhysics: const AlwaysScrollableScrollPhysics())),
                // Positioned(
                //     top: height * 0.2,
                //     left: 0.0,
                //     right: 0.0,
                //     child: Consumer<CorouselProvider>(
                //       builder: (context, element, child) => DotsIndicator(
                //         dotsCount: image.length ?? 1,
                //         position: element.initialPage ?? 0,
                //         decorator: DotsDecorator(
                //           activeSize: Size(width * 0.05, height * 0.01),
                //           color: AppColors.grey,
                //           activeColor: AppColors.buttonColor,
                //           activeShape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(5.0)),
                //         ),
                //       ),
                //     )),
                Positioned(
                  bottom: height * 0.02,
                  left: height * 0.009,
                  right: height * 0.009,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name.length > 10 ? name.substring(0, 10) : name,
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '$price \$',
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
                      child: Consumer<CarFavouritesProvider>(builder: (context, value, child) => value.loading?Center(
                        child: CircularProgressIndicator(),
                      ):InkWell(
                        onTap:(){
                          value.getCarFavourites.cars!.contains(carId)?
                          value.favouriteCarsRemove(context: context, url: "${AppUrls.baseUrl}${AppUrls.removeSavedCars}", id: carId)
                          :value.favouriteCarsPost(context,
                            details: {
                              'car_id':carId
                            },
                            url: '${AppUrls.baseUrl}${AppUrls.postSavedCars}'
                          );
                        },
                        child: Icon(
                          value.getCarFavourites.cars!.contains(carId)?Icons.star:Icons.star_border,
                          color: value.getCarFavourites.cars!.contains(carId)?AppColors.blue : AppColors.white,
                        ),
                      ),)
                    )),
              ],
            );
          },
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
