import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:wizmo/domain/app_repository.dart';
import 'package:wizmo/utils/navigator_class.dart';
import 'package:wizmo/view/home_screens/home_screen/car_detail_screen/car_detail_initials.dart';
import 'package:wizmo/view/home_screens/home_screen/car_detail_screen/car_detail_screen.dart';

class ViewMyCarsProvider with ChangeNotifier {
  AppRepository appRepository;
  ViewMyCarsProvider({required this.appRepository});
  final nextPageController = CarouselController();
  int _initialPage = 0;
  int get initialPage => _initialPage;
  navigateToCarDetail(
      {required BuildContext context, required CarDetailInitials detail}) {
    Navigation().push(CarDetailScreen(carDetailInitials: detail), context);
  }

  onChangeCorousel(int index) {
    _initialPage = index;
    notifyListeners();
  }
}
