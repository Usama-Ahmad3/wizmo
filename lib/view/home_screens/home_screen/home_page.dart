import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizmo/main.dart';
import 'package:wizmo/models/dynamic_car_detail_model.dart';
import 'package:wizmo/res/app_urls/app_urls.dart';
import 'package:wizmo/view/home_screens/home_screen/car_detail_screen/car_detail_initials.dart';
import 'package:wizmo/view/home_screens/home_screen/home_provider.dart';
import 'package:wizmo/view/home_screens/home_screen/home_widgets/car_container.dart';
import 'package:wizmo/view/login_signup/widgets/constants.dart';

import 'home_initial_params.dart';
import 'home_widgets/top_searchbar.dart';

class HomePage extends StatefulWidget {
  HomeInitialParams initialParams;
  HomePage({super.key, required this.initialParams});

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
                        SafeArea(child: Image.asset('assets/images/wizmo.jpg')),
                        const TopSearchBar(),
                        FutureBuilder(
                          future: context
                              .read<CorouselProvider>()
                              .getAllCarsHome(
                                  details: null,
                                  url:
                                      '${AppUrls.baseUrl}${AppUrls.allCarsHome}',
                                  context: context),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (!snapshot.hasData) {
                                return const Center(
                                    child: CircularProgressIndicator(
                                        color: Colors.black));
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator(
                                        color: Colors.red));
                              } else {
                                return Consumer<CorouselProvider>(
                                  builder: (context, provider, child) => Column(
                                    children: [
                                      ...List.generate(
                                          provider.allCarsHome.cars != null
                                              ? provider
                                                  .allCarsHome.cars!.length
                                              : 1,
                                          (index) => Consumer<HomeProvider>(
                                                builder:
                                                    (context, value, child) =>
                                                        CarContainer(
                                                  image: provider.allCarsHome
                                                      .cars![index].carImages!
                                                      .toList(),
                                                  price:
                                                      '${provider.allCarsHome.cars![index].price} \$',
                                                  admin: provider
                                                              .allCarsHome
                                                              .cars![index]
                                                              .role ==
                                                          'admin'
                                                      ? true
                                                      : false,
                                                  name: provider.allCarsHome
                                                      .cars![index].carName
                                                      .toString(),
                                                  model: provider.allCarsHome
                                                      .cars![index].make!
                                                      .toString(),
                                                  onTap: () {
                                                    DynamicCarDetailModel
                                                        imageDetail =
                                                        DynamicCarDetailModel(
                                                            model: provider
                                                                .allCarsHome
                                                                .cars![index]
                                                                .make!,
                                                            images: provider
                                                                .allCarsHome
                                                                .cars![index]
                                                                .carImages,
                                                            name: provider
                                                                .allCarsHome
                                                                .cars![index]
                                                                .carName,
                                                            description:
                                                                provider
                                                                    .allCarsHome
                                                                    .cars![
                                                                        index]
                                                                    .description,
                                                            location: provider
                                                                .allCarsHome
                                                                .cars![index]
                                                                .location,
                                                            sellerType: provider
                                                                .allCarsHome
                                                                .cars![index]
                                                                .sellerType,
                                                            longitude: provider
                                                                .allCarsHome
                                                                .cars![index]
                                                                .longitude,
                                                            latitude: provider
                                                                .allCarsHome
                                                                .cars![index]
                                                                .latitude,
                                                            email: provider
                                                                .allCarsHome
                                                                .cars![index]
                                                                .userEmail,
                                                            number: provider
                                                                .allCarsHome
                                                                .cars![index]
                                                                .userPhoneNumber,
                                                            sellerName: provider
                                                                .allCarsHome
                                                                .cars![index]
                                                                .userName,
                                                            price: provider
                                                                .allCarsHome
                                                                .cars![index]
                                                                .price);
                                                    print(
                                                        imageDetail.sellerType);
                                                    print(provider
                                                        .allCarsHome
                                                        .cars![index]
                                                        .sellerType);
                                                    var detail =
                                                        CarDetailInitials(
                                                            carDetails:
                                                                imageDetail,
                                                            featureName:
                                                                featureNames,
                                                            features: provider
                                                                .allCarsHome
                                                                .cars![index]
                                                                .features,
                                                            onTap: () {},
                                                            provider: getIt());
                                                    value.navigateToCarDetail(
                                                        detail, context);
                                                  },
                                                ),
                                              )),
                                    ],
                                  ),
                                );
                              }
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
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
