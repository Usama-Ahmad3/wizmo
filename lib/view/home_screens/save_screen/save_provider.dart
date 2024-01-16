import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:wizmo/domain/app_repository.dart';
import 'package:wizmo/main.dart';
import 'package:wizmo/models/Car%20Favourites%20models/get_car_favourites.dart';
import 'package:wizmo/models/dynamic_car_detail_model.dart';
import 'package:wizmo/res/app_urls/app_urls.dart';
import 'package:wizmo/res/authentication/authentication.dart';
import 'package:wizmo/utils/flushbar.dart';
import 'package:wizmo/utils/navigator_class.dart';
import 'package:wizmo/view/home_screens/home_screen/car_detail_screen/car_detail_initials.dart';
import 'package:wizmo/view/home_screens/home_screen/car_detail_screen/car_detail_screen.dart';
import 'package:wizmo/view/home_screens/home_screen/car_detail_screen/story_page.dart';
import 'package:wizmo/view/home_screens/main_bottom_bar/main_bottom_bar.dart';

class SaveProvider with ChangeNotifier {
  AppRepository appRepository;
  Authentication authentication;
  GetCarFavourites getCarFavourites;
  SaveProvider({required this.appRepository,required this.getCarFavourites,required this.authentication});
  bool _loading = false;
  bool _isLogIn = false;
  bool get isLogIn => _isLogIn;
  bool get loading => _loading;
  onRefresh() {
    _loading = true;
    notifyListeners();
    Future.delayed(const Duration(seconds: 2), () {
      _loading = false;
      notifyListeners();
    });
  }

  navigateToCarDetailScreen(
      {required BuildContext context,
      required List image,
      required String price,
      required String model,
      required String name}) {
    Navigation().push(
        CarDetailScreen(
            carDetailInitials: CarDetailInitials(
                provider: getIt(),
                carDetails: DynamicCarDetailModel(),
                onTap: () {
                  Navigation().push(StoryPage(files: image), context);
                })),
        context);
  }

  checkAuth(context) async {
    _loading = true;
    _isLogIn = await authentication.getAuth();
    print(await authentication.getToken());
    if (isLogIn) {
      favouriteCarsGet(
          context: context, url: '${AppUrls.baseUrl}${AppUrls.getSavedCars}');
    } else {
      navigateToHome(context);
    }
  }

  navigateToHome(context) async {
    Navigation().pushRep(MainBottomBar(provider: getIt()), context);
    await FlushBarUtils.flushBar(
        'Login required to see the saved cars', context, 'Login Required');
  }

  favouriteCarsGet({required BuildContext context, required String url}) async {
    var response =
        await appRepository.get(url: url, context: context, id: null);
    if (kDebugMode) {
      print(response);
    }
    if (response != null) {
      try {
        getCarFavourites = GetCarFavourites.fromJson(response);
        _loading = false;
        notifyListeners();
      } catch (e) {
        _loading = false;
        notifyListeners();
        if (kDebugMode) {
          print("Here is car's error $e");
        }
      }
    } else {
      print(getCarFavourites.cars);
      _loading = false;
      notifyListeners();
    }
  }

  navigateToCarDetail(var carDetailInitials, context) {
    Navigation()
        .push(CarDetailScreen(carDetailInitials: carDetailInitials), context);
  }
}
