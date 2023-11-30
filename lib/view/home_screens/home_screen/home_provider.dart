import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wizmo/domain/app_repository.dart';
import 'package:wizmo/main.dart';
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
  bool get loading => _loading;
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

  // showOverlay(
  //     {required BuildContext context,
  //     required double width,
  //     required double height,
  //     required VoidCallback more,
  //     String? title1,
  //     String? title2}) {
  //   if (overlayEntry != null) {
  //     return null;
  //   } else {
  //     OverlayState overlayState = Overlay.of(context);
  //     overlayEntry = OverlayEntry(
  //       builder: (context) {
  //         return Positioned(
  //           top: height * 0.25,
  //           right: width * 0.03,
  //           left: width * 0.22,
  //           child: Material(
  //             color: AppColors.white,
  //             shadowColor: AppColors.shadowColor,
  //             borderRadius: BorderRadius.circular(height * 0.01),
  //             elevation: 2,
  //             child: Padding(
  //               padding: EdgeInsets.symmetric(horizontal: width * 0.03),
  //               child: SizedBox(
  //                 height: height * 0.3,
  //                 width: width,
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Padding(
  //                       padding: EdgeInsets.symmetric(
  //                           horizontal: width * 0.03, vertical: height * 0.01),
  //                       child: Text(
  //                         'Find your perfect car',
  //                         style: Theme.of(context)
  //                             .textTheme
  //                             .headline3!
  //                             .copyWith(color: AppColors.black),
  //                       ),
  //                     ),
  //                     Padding(
  //                       padding: EdgeInsets.symmetric(
  //                           horizontal: width * 0.035,
  //                           vertical: height * 0.015),
  //                       child: InkWell(
  //                         onTap: () {
  //                           selectChoice(MediaQuery.of(context).size, context,
  //                               'Make', '');
  //                           overlayRemove();
  //                         },
  //                         child: Container(
  //                           height: height * 0.055,
  //                           width: width,
  //                           decoration: BoxDecoration(
  //                             color: Colors.white,
  //                             boxShadow: [
  //                               BoxShadow(
  //                                   color: AppColors.shadowColor,
  //                                   blurRadius: 2,
  //                                   blurStyle: BlurStyle.outer,
  //                                   offset: const Offset(0, 0))
  //                             ],
  //                             borderRadius: BorderRadius.circular(8),
  //                           ),
  //                           child: Center(
  //                             child: Text(
  //                               title1!,
  //                               // title!.isEmpty?'Select Make':title,
  //                               style: Theme.of(context)
  //                                   .textTheme
  //                                   .headline3!
  //                                   .copyWith(color: AppColors.black),
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     InkWell(
  //                       onTap: () {},
  //                       child: Padding(
  //                         padding: EdgeInsets.symmetric(
  //                             horizontal: width * 0.035,
  //                             vertical: height * 0.015),
  //                         child: Container(
  //                           height: height * 0.055,
  //                           width: width,
  //                           decoration: BoxDecoration(
  //                               color: Colors.white,
  //                               boxShadow: [
  //                                 BoxShadow(
  //                                     color: AppColors.shadowColor,
  //                                     blurRadius: 2,
  //                                     blurStyle: BlurStyle.outer,
  //                                     offset: const Offset(0, 0))
  //                               ],
  //                               borderRadius: BorderRadius.circular(8)),
  //                           child: InkWell(
  //                             onTap: () {
  //                               selectChoice(MediaQuery.of(context).size,
  //                                   context, 'Model', title1);
  //                               overlayRemove();
  //                             },
  //                             child: Center(
  //                               child: Text(
  //                                 title2 ?? 'Select Model',
  //                                 style: Theme.of(context)
  //                                     .textTheme
  //                                     .headline3!
  //                                     .copyWith(
  //                                         color: title1 == 'Select Make'
  //                                             ? AppColors.grey
  //                                             : AppColors.black),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     Padding(
  //                       padding: EdgeInsets.symmetric(
  //                           horizontal: width * 0.02, vertical: height * 0.02),
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           InkWell(
  //                             onTap: () {
  //                               onRefresh();
  //                               overlayRemove();
  //                               // flushBarUtils('Checking', context, 'Test');
  //                             },
  //                             child: const Row(
  //                               children: [
  //                                 Icon(Icons.refresh),
  //                                 Text('Refresh')
  //                               ],
  //                             ),
  //                           ),
  //                           InkWell(
  //                               onTap: more, child: const Text('More options'))
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //         );
  //       },
  //     );
  //     overlayState.insert(overlayEntry!);
  //     // Future.delayed(const Duration(seconds: 4), () {
  //     //   overlayRemove();
  //     // });
  //   }
  // }

  // overlayRemove() {
  //   if (overlayEntry != null) {
  //     overlayEntry!.remove();
  //     overlayEntry = null;
  //   }
  // }

  flushBarUtils(String msg, BuildContext context, String title) {
    FlushBarUtils.flushBar(msg, context, title);
  }

  get(String url, BuildContext context) async {
    await appRepository.get(url, context);
  }

  onChangeCorousel(int index) {
    _initialPage = index;
    notifyListeners();
  }

  List car = [
    'Ye backend se ayegi is liye list names change ho jaye gey',
    'BMI',
    'Audi',
    'Carola',
    'Honda',
    'Suzuki',
    'Mercedes',
    'Motorola',
    'Ferrari',
    'Sedan',
    'Ford',
  ];
  selectChoice(Size size, BuildContext context, String title) {
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
                    car.length,
                    (index) => InkWell(
                          onTap: () {
                            title == 'Make'
                                ? _make = car[index]
                                : _model = car[index];
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
                                  color: AppColors.buttonColor.withOpacity(0.7),
                                  borderRadius:
                                      BorderRadius.circular(size.height * 0.01),
                                  border:
                                      Border.all(color: AppColors.transparent),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.04),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        car[index],
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
