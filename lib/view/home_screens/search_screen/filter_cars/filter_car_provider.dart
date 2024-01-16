import 'package:flutter/cupertino.dart';
import 'package:wizmo/domain/app_repository.dart';
import 'package:wizmo/models/all_cars_home.dart';
import 'package:wizmo/utils/navigator_class.dart';
import 'package:wizmo/view/home_screens/home_screen/car_detail_screen/car_detail_initials.dart';
import 'package:wizmo/view/home_screens/home_screen/car_detail_screen/car_detail_screen.dart';
import 'package:wizmo/view/home_screens/search_screen/filter_cars/filter_cars.dart';

class FilterCarProvider extends ChangeNotifier {
  AppRepository appRepository;
  AllCarsHome myAllCarModel;
  FilterCarProvider({required this.myAllCarModel, required this.appRepository});
  bool _loading = true;
  bool get loading => _loading;

  viewMyAllCars({required BuildContext context, required String url}) async {
    var response =
        await appRepository.get(url: url, context: context, id: null);
    print(response);
    if (response != null) {
      try {
        myAllCarModel = AllCarsHome.fromJson(response);
        _loading = false;
        notifyListeners();
      } catch (e) {
        print('EEEEEEEEERRRRRRRRRRRRRRRROOOOOOOOOOORRRRR');
        print(e);
      }
    } else {
      _loading = false;
      notifyListeners();
    }
  }

  navigateToCarDetail(
      {required BuildContext context, required CarDetailInitials detail}) {
    Navigation().push(CarDetailScreen(carDetailInitials: detail), context);
  }
}
