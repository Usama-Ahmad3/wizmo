import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizmo/main.dart';
import 'package:wizmo/models/dynamic_car_detail_model.dart';
import 'package:wizmo/res/app_urls/app_urls.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/res/common_widgets/cashed_image.dart';
import 'package:wizmo/res/common_widgets/empty_screen.dart';
import 'package:wizmo/utils/navigator_class.dart';
import 'package:wizmo/view/home_screens/Favourites_Screens/favourites_provider.dart';
import 'package:wizmo/view/home_screens/account_screen/empty.dart';
import 'package:wizmo/view/home_screens/home_screen/car_detail_screen/car_detail_initials.dart';
import 'package:wizmo/view/home_screens/home_screen/home_provider.dart';
import 'package:wizmo/view/home_screens/home_screen/home_widgets/car_container.dart';
import 'package:wizmo/view/home_screens/save_screen/save_provider.dart';
import 'package:wizmo/view/login_signup/login/login.dart';
import 'package:wizmo/view/login_signup/signup/signup.dart';
import 'package:wizmo/view/login_signup/widgets/constants.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({super.key});

  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  @override
  void initState() {
    print('In the Save Screen');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final provider = Provider.of<SaveProvider>(context, listen: false);
    provider.checkAuth(context);
    return Consumer<SaveProvider>(builder: (context, value, child) {
      return RefreshIndicator(
        displacement: 200,
        onRefresh: () async {
          value.onRefresh();
        },
        child: value.loading
            ? const Center(child: CircularProgressIndicator())
            : Scaffold(
                appBar: AppBar(
                  title: Text(
                    'Saved',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: AppColors.black),
                  ),
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                ),
                body: value.isLogIn
                    ? value.getCarFavourites.cars == null
                        ? EmptyScreen(
                            text: 'Nothing found in saved cars',
                            text2: 'First go and save your favorite cars')
                        : SingleChildScrollView(
                            child: Column(
                              children: [
                                ...List.generate(
                                    value.getCarFavourites.cars!.length,
                                    (car) => Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: width * 0.05,
                                              vertical: height * 0.012),
                                          child: Container(
                                            height: height * 0.3,
                                            width: width,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        height * 0.01),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: AppColors
                                                          .shadowColor
                                                          .withOpacity(0.17),
                                                      blurStyle:
                                                          BlurStyle.normal,
                                                      offset:
                                                          const Offset(1, 1),
                                                      blurRadius: 12,
                                                      spreadRadius: 2)
                                                ],
                                                color: AppColors.white),
                                            child: Consumer<CorouselProvider>(
                                              builder: (context, value, child) {
                                                return Stack(
                                                  children: [
                                                    CarouselSlider.builder(
                                                        itemCount: provider
                                                            .getCarFavourites
                                                            .cars![car]
                                                            .car!
                                                            .carImages!
                                                            .length,
                                                        itemBuilder: (context,
                                                            index, realIndex) {
                                                          return InkWell(
                                                            onTap: () {
                                                              DynamicCarDetailModel imageDetail = DynamicCarDetailModel(
                                                                  model: provider
                                                                      .getCarFavourites
                                                                      .cars![
                                                                          car]
                                                                      .car!
                                                                      .make!,
                                                                  images: provider
                                                                      .getCarFavourites
                                                                      .cars![
                                                                          car]
                                                                      .car!
                                                                      .carImages,
                                                                  name: provider
                                                                      .getCarFavourites
                                                                      .cars![
                                                                          car]
                                                                      .car!
                                                                      .carName,
                                                                  description: provider
                                                                      .getCarFavourites
                                                                      .cars![
                                                                          car]
                                                                      .car!
                                                                      .description,
                                                                  location: provider
                                                                      .getCarFavourites
                                                                      .cars![
                                                                          car]
                                                                      .car!
                                                                      .location,
                                                                  sellerType: provider
                                                                      .getCarFavourites
                                                                      .cars![
                                                                          car]
                                                                      .car!
                                                                      .sellertype,
                                                                  longitude: provider
                                                                      .getCarFavourites
                                                                      .cars![
                                                                          car]
                                                                      .car!
                                                                      .longitude,
                                                                  latitude: provider
                                                                      .getCarFavourites
                                                                      .cars![car]
                                                                      .car!
                                                                      .latitude,
                                                                  email: provider.getCarFavourites.cars![car].car!.userEmail,
                                                                  number: provider.getCarFavourites.cars![car].car!.userPhoneNumber,
                                                                  sellerName: provider.getCarFavourites.cars![car].car!.userName,
                                                                  addCarId: provider.getCarFavourites.cars![car].carId.toString(),
                                                                  price: provider.getCarFavourites.cars![car].car!.price);
                                                              var detail = CarDetailInitials(
                                                                  carDetails:
                                                                      imageDetail,
                                                                  featureName:
                                                                      featureNames,
                                                                  features: provider
                                                                      .getCarFavourites
                                                                      .cars![
                                                                          car]
                                                                      .car!
                                                                      .features,
                                                                  onTap: () {},
                                                                  provider:
                                                                      getIt());
                                                              provider
                                                                  .navigateToCarDetail(
                                                                      detail,
                                                                      context);
                                                            },
                                                            child: Column(
                                                              children: [
                                                                SizedBox(
                                                                  height:
                                                                      height *
                                                                          0.23,
                                                                  width: width,
                                                                  child: provider
                                                                              .getCarFavourites
                                                                              .cars![car]
                                                                              .car!
                                                                              .role ==
                                                                          'admin'
                                                                      ? Banner(
                                                                          location:
                                                                              BannerLocation.topStart,
                                                                          layoutDirection:
                                                                              TextDirection.ltr,
                                                                          message:
                                                                              'Admin',
                                                                          color:
                                                                              Colors.red,
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(height * 0.01),
                                                                            child: cachedNetworkImage(
                                                                                height: height * 0.23,
                                                                                width: width,
                                                                                cuisineImageUrl: provider.getCarFavourites.cars![car].car!.carImages![index] ?? '',
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
                                                                              cuisineImageUrl: provider.getCarFavourites.cars![car].car!.carImages![index] ?? '',
                                                                              imageFit: BoxFit.fill,
                                                                              errorFit: BoxFit.fill),
                                                                        ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                        carouselController: value
                                                            .nextPageController,
                                                        options:
                                                            CarouselOptions(
                                                                autoPlay: true,
                                                                autoPlayCurve: Curves
                                                                    .easeInOut,
                                                                onPageChanged:
                                                                    (index,
                                                                        reason) {
                                                                  value.onChangeCorousel(
                                                                      index);
                                                                },
                                                                height: height,
                                                                viewportFraction:
                                                                    1,
                                                                animateToClosest:
                                                                    true,
                                                                initialPage: value
                                                                    .initialPage,
                                                                scrollDirection:
                                                                    Axis
                                                                        .horizontal,
                                                                scrollPhysics:
                                                                    const AlwaysScrollableScrollPhysics())),
                                                    Positioned(
                                                      bottom: height * 0.02,
                                                      left: height * 0.009,
                                                      right: height * 0.009,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            provider
                                                                        .getCarFavourites
                                                                        .cars![
                                                                            car]
                                                                        .car!
                                                                        .carName!
                                                                        .length >
                                                                    10
                                                                ? provider
                                                                    .getCarFavourites
                                                                    .cars![car]
                                                                    .car!
                                                                    .carName!
                                                                    .substring(
                                                                        0, 10)
                                                                : provider
                                                                    .getCarFavourites
                                                                    .cars![car]
                                                                    .car!
                                                                    .carName
                                                                    .toString(),
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headline3!
                                                                .copyWith(
                                                                    color: AppColors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                          ),
                                                          Text(
                                                            '${provider.getCarFavourites.cars![car].car!.price} \$',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headline3!
                                                                .copyWith(
                                                                    color:
                                                                        AppColors
                                                                            .red),
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
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        height *
                                                                            0.008),
                                                            color: AppColors
                                                                .grey
                                                                .withOpacity(
                                                                    0.65),
                                                            shape: BoxShape
                                                                .rectangle),
                                                        child: Center(
                                                            child: Text(
                                                          provider
                                                              .getCarFavourites
                                                              .cars![car]
                                                              .car!
                                                              .make!
                                                              .toString(),
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .headline4!
                                                              .copyWith(
                                                                  color: AppColors
                                                                      .white),
                                                        )),
                                                      ),
                                                    ),
                                                    Positioned(
                                                        right: width * 0.02,
                                                        top: height * 0.009,
                                                        child: CircleAvatar(
                                                            backgroundColor:
                                                                AppColors.grey
                                                                    .withOpacity(
                                                                        0.65),
                                                            radius:
                                                                height * 0.021,
                                                            child: Consumer<
                                                                CarFavouritesProvider>(
                                                              builder: (context,
                                                                      value,
                                                                      child) =>
                                                                  InkWell(
                                                                onTap: () {
                                                                  value.favoriteCarIds.contains(int.parse(value
                                                                          .getCarFavourites
                                                                          .cars![
                                                                              car]
                                                                          .carId
                                                                          .toString()))
                                                                      ? value
                                                                          .favouriteCarsRemove(
                                                                          localId: value
                                                                              .getCarFavourites
                                                                              .cars![car]
                                                                              .carId
                                                                              .toString(),
                                                                          context:
                                                                              context,
                                                                          url:
                                                                              "${AppUrls.baseUrl}${AppUrls.removeSavedCars}",
                                                                        )
                                                                      : value.favouriteCarsPost(
                                                                          context:
                                                                              context,
                                                                          localId: value
                                                                              .getCarFavourites
                                                                              .cars![
                                                                                  car]
                                                                              .carId
                                                                              .toString(),
                                                                          details: {
                                                                            'car_id':
                                                                                value.getCarFavourites.cars![car].carId.toString()
                                                                          },
                                                                          url:
                                                                              '${AppUrls.baseUrl}${AppUrls.postSavedCars}');
                                                                  setState(() {
                                                                    provider.checkAuth(
                                                                        context);
                                                                  });
                                                                },
                                                                child: Icon(
                                                                  value.getCarFavourites
                                                                              .cars !=
                                                                          null
                                                                      ? value.favoriteCarIds.contains(int.parse(value
                                                                              .getCarFavourites
                                                                              .cars![
                                                                                  car]
                                                                              .carId
                                                                              .toString()))
                                                                          ? Icons
                                                                              .star
                                                                          : Icons
                                                                              .star_border
                                                                      : null,
                                                                  color: value.getCarFavourites
                                                                              .cars !=
                                                                          null
                                                                      ? value.favoriteCarIds.contains(int.parse(value
                                                                              .getCarFavourites
                                                                              .cars![
                                                                                  car]
                                                                              .carId
                                                                              .toString()))
                                                                          ? AppColors
                                                                              .blue
                                                                          : AppColors
                                                                              .white
                                                                      : null,
                                                                ),
                                                              ),
                                                            ))),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        )),
                              ],
                            ),
                          )
                    : Empty(
                        login: () {
                          navigateToLogin();
                        },
                        signup: () {
                          navigateToSignup();
                        },
                      ),
              ),
      );
    });
  }

  navigateToSignup() {
    Navigation().push(SignUp(provider: getIt()), context);
  }

  navigateToLogin() {
    Navigation().push(LogIn(provider: getIt()), context);
  }
}
