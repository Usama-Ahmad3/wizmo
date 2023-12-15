import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wizmo/domain/app_repository.dart';
import 'package:wizmo/main.dart';
import 'package:wizmo/models/car_model.dart';
import 'package:wizmo/models/make_model.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/utils/flushbar.dart';
import 'package:wizmo/utils/navigator_class.dart';
import 'package:wizmo/view/home_screens/home_screen/car_detail_screen/car_detail_screen.dart';
import 'package:wizmo/view/home_screens/main_bottom_bar/main_bottom_bar.dart';

class HomeProvider extends ChangeNotifier {
  AppRepository appRepository;
  HomeProvider({required this.appRepository});
  final nextPageController = CarouselController();
  var searchController = TextEditingController();
  int _initialPage = 0;
  int countCars = 23138;
  String _make = '';
  String get make => _make;
  String _model = '';
  String get model => _model;
  int get initialPage => _initialPage;
  bool _loading = false;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool get loading => _loading;
  bool _makeLoading = false;
  bool get makeLoading => _makeLoading;
  MakeModel makeModel = MakeModel();
  CarModel carModel = CarModel();
  OverlayEntry? overlayEntry;
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

  onChangeCorousel(int index) {
    _initialPage = index;
    notifyListeners();
  }

  Future getMake(
      {required loginDetails, required url, required context}) async {
    _makeLoading = true;
    notifyListeners();
    var response = await appRepository.post(
        url: url, context: context, details: loginDetails);
    print("response$response");
    if (response != null) {
      makeModel = MakeModel.fromJson(response);
      print(makeModel.make![0].name);
    }
    _makeLoading = false;
    notifyListeners();
  }

  Future getModel(
      {required loginDetails, required url, required context}) async {
    _isLoading = true;
    notifyListeners();
    var response = await appRepository.post(
        url: url, context: context, details: loginDetails);
    print("response$response");
    if (response != null) {
      carModel = CarModel.fromJson(response);
    }
    _isLoading = false;
    notifyListeners();
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
