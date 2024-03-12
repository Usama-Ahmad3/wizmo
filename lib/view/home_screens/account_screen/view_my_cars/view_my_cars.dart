import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizmo/main.dart';
import 'package:wizmo/models/dynamic_car_detail_model.dart';
import 'package:wizmo/res/app_urls/app_urls.dart';
import 'package:wizmo/view/home_screens/account_screen/view_my_cars/view_my_cars_provider.dart';
import 'package:wizmo/view/home_screens/home_screen/car_detail_screen/car_detail_initials.dart';
import 'package:wizmo/view/home_screens/home_screen/home_widgets/car_container.dart';
import 'package:wizmo/view/login_signup/widgets/constants.dart';

// ignore: must_be_immutable
class ViewMyCars extends StatelessWidget {
  ViewMyCars({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    final provider = Provider.of<ViewMyCarsProvider>(context, listen: false);
    provider.viewMyAllCars(
        context: context,
        url: '${AppUrls.baseUrl}${AppUrls.myAllCars}',
        details: null);
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Cars'),
        ),
        body: SingleChildScrollView(child:
            Consumer<ViewMyCarsProvider>(builder: (context, value, child) {
          return value.loading
              ? SizedBox(
                  height: height * 0.9,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : value.myAllCarModel.cars != null
                  ? Column(
                      children: [
                        ...List.generate(value.myAllCarModel.cars!.length,
                            (index) {
                          return CarContainer(
                            addCarId:
                                value.myAllCarModel.cars![index].id.toString(),
                            image: value.myAllCarModel.cars![index].carImages!
                                .toList(),
                            price: value.myAllCarModel.cars![index].price
                                .toString(),
                            name: value.myAllCarModel.cars![index].carName
                                .toString(),
                            model: value.myAllCarModel.cars![index].model
                                .toString(),
                            onTap: () {
                              DynamicCarDetailModel carDetails =
                                  DynamicCarDetailModel(
                                      model: value
                                          .myAllCarModel.cars![index].model,
                                      sellerType: value.myAllCarModel
                                          .cars![index].sellerType,
                                      price: value
                                          .myAllCarModel.cars![index].price,
                                      name: value
                                          .myAllCarModel.cars![index].carName,
                                      description: value.myAllCarModel
                                          .cars![index].description,
                                      images: value
                                          .myAllCarModel.cars![index].carImages,
                                      latitude: value
                                          .myAllCarModel.cars![index].latitude,
                                      longitude: value
                                          .myAllCarModel.cars![index].longitude,
                                      location: value
                                          .myAllCarModel.cars![index].location,
                                      sellerName: value
                                          .myAllCarModel.cars![index].userName,
                                      addCarId: value
                                          .myAllCarModel.cars![index].id
                                          .toString(),
                                      number: value.myAllCarModel.cars![index]
                                          .userPhoneNumber,
                                      email: value.myAllCarModel.cars![index]
                                          .userEmail);
                              var detail = CarDetailInitials(
                                  carDetails: carDetails,
                                  myCars: true,
                                  featureName: featureNames,
                                  provider: getIt(),
                                  features:
                                      value.myAllCarModel.cars![index].features,
                                  onTap: () {});
                              value.navigateToCarDetail(
                                  detail: detail, context: context);
                            },
                          );
                        }),
                      ],
                    )
                  : SizedBox(
                      height: height * 0.8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: height * 0.2,
                              width: width,
                              child: Image.asset('assets/images/icon.png')),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          const Text('Nothing in your cars'),
                          const Text(
                              'Add a car then come here to see your added cars'),
                        ],
                      ),
                    );
        })));
  }
}
