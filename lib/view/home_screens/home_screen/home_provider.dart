import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wizmo/models/all_cars_home.dart';
import 'package:wizmo/models/selling_models/car_model.dart';
import 'package:wizmo/models/selling_models/make_model.dart';
import 'package:wizmo/domain/app_repository.dart';
import 'package:wizmo/main.dart';
import 'package:wizmo/res/app_urls/app_urls.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/utils/flushbar.dart';
import 'package:wizmo/utils/navigator_class.dart';
import 'package:wizmo/view/home_screens/home_screen/car_detail_screen/car_detail_screen.dart';
import 'package:wizmo/view/home_screens/main_bottom_bar/main_bottom_bar.dart';

class HomeProvider extends ChangeNotifier {
  AppRepository appRepository;
  MakeModel makeModel;
  CarModel carModel;
  AllCarsHome allCarsHome;
  HomeProvider(
      {required this.appRepository,
      required this.makeModel,
      required this.allCarsHome,
      required this.carModel});
  var searchController = TextEditingController();
  int countCars = 23138;
  String _make = '';
  String get make => _make;
  String _model = '';
  String get model => _model;
  bool _loading = false;
  bool get loading => _loading;
  onRefresh() {
    _make = '';
    _model = '';
    _loading = true;
    notifyListeners();
    Future.delayed(const Duration(seconds: 2), () {
      _loading = false;
      notifyListeners();
    });
  }

  flushBarUtils(String msg, BuildContext context, String title) {
    FlushBarUtils.flushBar(msg, context, title);
  }

  Future getMake(
      {required loginDetails, required url, required context}) async {
    var response = await appRepository.post(
        url: url, context: context, details: loginDetails);
    print("response$response");
    if (response != null) {
      makeModel = MakeModel.fromJson(response);
    }
  }

  Future getModel(
      {required loginDetails, required url, required context}) async {
    var response = await appRepository.post(
        url: url, context: context, details: loginDetails);
    print("response$response");
    if (response != null) {
      carModel = CarModel.fromJson(response);
    }
  }

  Future getAllCarsHome(
      {required BuildContext context,
      required String url,
      Map? details}) async {
    print('object');
    var response;
    if (make == '') {
      response = await appRepository.post(
          url: url, context: context, details: details);
    } else if (make != '') {
      response = await appRepository.get(
          url: '${AppUrls.baseUrl}${AppUrls.filterCars}make=$make',
          context: context,
          id: null);
    } else if (model != '') {
      response = await appRepository.get(
          url:
              '${AppUrls.baseUrl}${AppUrls.filterCars}?make=$make&model=$model',
          context: context,
          id: null);
    }
    print(response);
    if (response != null) {
      allCarsHome = AllCarsHome.fromJson(response);
    } else {
      // _loading = false;
      notifyListeners();
    }
    return allCarsHome;
  }

  selectChoice(Size size, BuildContext context, String title) {
    if (title == 'Make' ? makeModel.make != null : carModel.model != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Select $title',
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: AppColors.white),
          ),
          elevation: 5,
          backgroundColor: AppColors.shadowColor.withOpacity(0.1),
          contentPadding: EdgeInsets.symmetric(
              vertical: size.height * 0.03, horizontal: size.width * 0.01),
          content: SizedBox(
            height: size.height * 0.45,
            width: size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...List.generate(
                      title == 'Make'
                          ? makeModel.make!.length
                          : carModel.model!.length,
                      (index) => InkWell(
                            onTap: () {
                              title == 'Make'
                                  ? _make =
                                      makeModel.make![index].name.toString()
                                  : _model =
                                      carModel.model![index].model.toString();
                              notifyListeners();
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.003),
                              child: Container(
                                  height: size.height * 0.07,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: AppColors.shadowColor
                                              .withOpacity(0.17),
                                          blurStyle: BlurStyle.normal,
                                          offset: const Offset(1, 1),
                                          blurRadius: 5,
                                          spreadRadius: 1)
                                    ],
                                    color:
                                        AppColors.buttonColor.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(
                                        size.height * 0.01),
                                    border: Border.all(
                                        color: AppColors.transparent),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.04),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          title == 'Make'
                                              ? makeModel.make![index].name
                                                  .toString()
                                              : carModel.model![index].model
                                                  .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3!
                                              .copyWith(color: AppColors.white),
                                        ),
                                        Text('tap to select',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4!
                                                .copyWith(
                                                    color: AppColors.white)),
                                      ],
                                    ),
                                  )),
                            ),
                          ))
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  ///navigations
  navigateToSearch(index, context) {
    Navigation().pushRep(
        MainBottomBar(
          index: index,
          provider: getIt(),
        ),
        context);
    // Navigator.pushNamed(context, RouteName.search);
  }

  navigateToCarDetail(var carDetailInitials, context) {
    Navigation()
        .push(CarDetailScreen(carDetailInitials: carDetailInitials), context);
  }
}

class CorouselProvider extends ChangeNotifier {
  AppRepository appRepository;
  AllCarsHome allCarsHome;
  CorouselProvider({required this.appRepository, required this.allCarsHome});
  final nextPageController = CarouselController();
  int _initialPage = 0;
  int get initialPage => _initialPage;
  String? make;
  String? model;
  onChangeCorousel(int index) {
    _initialPage = index;
    notifyListeners();
  }

  Future getAllCarsHome(
      {required BuildContext context,
      required String url,
      Map? details}) async {
    print('object');
    var response =
        await appRepository.post(url: url, context: context, details: details);
    print(response);
    if (response != null) {
      allCarsHome = AllCarsHome.fromJson(response);
    } else {
      // _loading = false;
      notifyListeners();
    }
    return allCarsHome;
  }

  Future getAllCarsFilter(
      {required BuildContext context,
      required String url,
      Map? details}) async {
    print('Filter');
    var response =
        await appRepository.get(url: url, context: context, id: null);
    // print(response);
    if (response != null) {
      allCarsHome = AllCarsHome.fromJson(response);
    } else {
      // _loading = false;
      notifyListeners();
    }
    return allCarsHome;
  }
}
