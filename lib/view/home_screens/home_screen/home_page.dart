import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizmo/main.dart';
import 'package:wizmo/models/dynamic_car_detail_model.dart';
import 'package:wizmo/res/app_urls/app_urls.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/res/common_widgets/empty_screen.dart';
import 'package:wizmo/view/home_screens/Favourites_Screens/favourites_provider.dart';
import 'package:wizmo/view/home_screens/home_screen/car_detail_screen/car_detail_initials.dart';
import 'package:wizmo/view/home_screens/home_screen/home_provider.dart';
import 'package:wizmo/view/home_screens/home_screen/home_widgets/car_container.dart';
import 'package:wizmo/view/login_signup/widgets/constants.dart';
import 'home_initial_params.dart';
import 'home_widgets/top_searchbar.dart';

class HomePage extends StatefulWidget {
  final HomeInitialParams initialParams;
  const HomePage({super.key, required this.initialParams});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeProvider get homeProvider => widget.initialParams.provider;
  @override
  void initState() {
    print('In The Home Screen');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final provider = Provider.of<CarFavouritesProvider>(context, listen: false);
    provider.favouriteCarsGet(
        context: context, url: '${AppUrls.baseUrl}${AppUrls.getSavedCars}');
    return Consumer<HomeProvider>(builder: (context, value, child) {
      return RefreshIndicator(
          displacement: 200,
          onRefresh: () async {
            context.read<HomeProvider>().onRefresh();
          },
          child: value.loading
              ? const Center(child: CircularProgressIndicator())
              : Scaffold(
                  body: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () {
                              print(provider.favoriteCarIds);
                            },
                            child: SafeArea(
                                child: Image.asset('assets/images/wizmo.jpg'))),
                        TopSearchBar(),
                        FutureBuilder(
                          future: context.read<HomeProvider>().getAllCarsHome(
                              details: null,
                              url: '${AppUrls.baseUrl}${AppUrls.allCarsHome}',
                              context: context),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (!snapshot.hasData) {
                                return Padding(
                                  padding: EdgeInsets.only(top: height * 0.02),
                                  child: EmptyScreen(
                                      text: 'No cars found',
                                      text2:
                                          'Go to sell tab and add your first car'),
                                );
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return SizedBox(
                                  height: height * 0.4,
                                  child: Center(
                                      child: CircularProgressIndicator(
                                          color: AppColors.buttonColor)),
                                );
                              } else {
                                return Consumer<HomeProvider>(
                                    builder: (context, providerHome, child) {
                                  return Column(
                                    children: [
                                      ...List.generate(
                                          providerHome.allCarsHome.cars != null
                                              ? providerHome
                                                  .allCarsHome.cars!.length
                                              : 1,
                                          (index) => Consumer<HomeProvider>(
                                                  builder:
                                                      (context, value, child) {
                                                return CarContainer(
                                                  addCarId: providerHome
                                                      .allCarsHome
                                                      .cars![index]
                                                      .id
                                                      .toString(),
                                                  image: providerHome
                                                      .allCarsHome
                                                      .cars![index]
                                                      .carImages!
                                                      .toList(),
                                                  price:
                                                      '${providerHome.allCarsHome.cars![index].price} \$',
                                                  admin: providerHome
                                                              .allCarsHome
                                                              .cars![index]
                                                              .role ==
                                                          'admin'
                                                      ? true
                                                      : false,
                                                  name: providerHome.allCarsHome
                                                      .cars![index].carName
                                                      .toString(),
                                                  model: providerHome
                                                      .allCarsHome
                                                      .cars![index]
                                                      .make!
                                                      .toString(),
                                                  onTap: () {
                                                    print(providerHome
                                                        .allCarsHome
                                                        .cars![index]
                                                        .id
                                                        .toString());
                                                    DynamicCarDetailModel imageDetail = DynamicCarDetailModel(
                                                        model: providerHome
                                                            .allCarsHome
                                                            .cars![index]
                                                            .make!,
                                                        images: providerHome
                                                            .allCarsHome
                                                            .cars![index]
                                                            .carImages,
                                                        name: providerHome
                                                            .allCarsHome
                                                            .cars![index]
                                                            .carName,
                                                        description: providerHome
                                                            .allCarsHome
                                                            .cars![index]
                                                            .description,
                                                        location: providerHome
                                                            .allCarsHome
                                                            .cars![index]
                                                            .location,
                                                        sellerType: providerHome
                                                            .allCarsHome
                                                            .cars![index]
                                                            .sellerType,
                                                        addCarId: providerHome.allCarsHome.cars![index].id
                                                            .toString(),
                                                        longitude: providerHome
                                                            .allCarsHome
                                                            .cars![index]
                                                            .longitude,
                                                        latitude: providerHome
                                                            .allCarsHome
                                                            .cars![index]
                                                            .latitude,
                                                        email: providerHome
                                                            .allCarsHome
                                                            .cars![index]
                                                            .userEmail,
                                                        number: providerHome
                                                            .allCarsHome
                                                            .cars![index]
                                                            .userPhoneNumber,
                                                        sellerName: providerHome
                                                            .allCarsHome
                                                            .cars![index]
                                                            .userName,
                                                        price: providerHome.allCarsHome.cars![index].price);
                                                    print(
                                                        imageDetail.sellerType);
                                                    print(providerHome
                                                        .allCarsHome
                                                        .cars![index]
                                                        .sellerType);
                                                    var detail =
                                                        CarDetailInitials(
                                                            carDetails:
                                                                imageDetail,
                                                            featureName:
                                                                featureNames,
                                                            features:
                                                                providerHome
                                                                    .allCarsHome
                                                                    .cars![
                                                                        index]
                                                                    .features,
                                                            onTap: () {},
                                                            provider: getIt());
                                                    value.navigateToCarDetail(
                                                        detail, context);
                                                  },
                                                );
                                              })),
                                    ],
                                  );
                                });
                              }
                            } else {
                              return SizedBox(
                                height: height * 0.4,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.buttonColor,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ));
    });
  }
}
