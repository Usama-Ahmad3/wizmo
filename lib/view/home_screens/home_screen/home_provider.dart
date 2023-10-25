import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wizmo/domain/app_repository.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/utils/flushbar.dart';

class HomeProvider extends ChangeNotifier {
  AppRepository appRepository;
  final nextPageController = CarouselController();
  HomeProvider({required this.appRepository});
  var searchController = TextEditingController();
  int _initialPage = 0;
  int get initialPage => _initialPage;
  OverlayEntry? overlayEntry;
  showOverlay(
      BuildContext context, double width, double height, VoidCallback more) {
    if (overlayEntry != null) {
      return null;
    } else {
      OverlayState overlayState = Overlay.of(context);
      overlayEntry = OverlayEntry(
        builder: (context) {
          return Positioned(
            top: height * 0.25,
            right: width * 0.03,
            left: width * 0.22,
            child: Material(
              color: AppColors.white,
              shadowColor: AppColors.shadowColor,
              borderRadius: BorderRadius.circular(height * 0.01),
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: SizedBox(
                  height: height * 0.33,
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.03, vertical: height * 0.01),
                        child: Text(
                          'Find your perfect car',
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(color: AppColors.black),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.035,
                            vertical: height * 0.015),
                        child: Container(
                          height: height * 0.06,
                          width: width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.shadowColor,
                                  blurRadius: 2,
                                  blurStyle: BlurStyle.outer,
                                  offset: const Offset(0, 0))
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              'Select Make',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(color: AppColors.black),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.035,
                            vertical: height * 0.015),
                        child: Container(
                          height: height * 0.06,
                          width: width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.shadowColor,
                                    blurRadius: 2,
                                    blurStyle: BlurStyle.outer,
                                    offset: const Offset(0, 0))
                              ],
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Text(
                              'Select Model',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(color: AppColors.black),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.02, vertical: height * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                flushBarUtils('Checking', context, 'Test');
                              },
                              child: const Row(
                                children: [
                                  Icon(Icons.refresh),
                                  Text('Refresh')
                                ],
                              ),
                            ),
                            InkWell(
                                onTap: more, child: const Text('More options'))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
      overlayState.insert(overlayEntry!);
      Future.delayed(const Duration(seconds: 4), () {
        overlayRemove();
      });
    }
  }

  overlayRemove() {
    if (overlayEntry != null) {
      overlayEntry!.remove();
      overlayEntry = null;
    }
  }

  flushBarUtils(String msg, BuildContext context, String title) {
    FlushBarUtils.flushBar(msg, context, title);
  }

  get(String url, BuildContext context) async {
    await appRepository.get(url, context);
  }

  onChange(int index) {
    _initialPage = index;
    notifyListeners();
  }
}
