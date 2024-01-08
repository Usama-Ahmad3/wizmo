import 'package:flutter/cupertino.dart';
import 'package:wizmo/main.dart';
import 'package:wizmo/models/dynamic_car_detail_model.dart';
import 'package:wizmo/res/authentication/authentication.dart';
import 'package:wizmo/utils/flushbar.dart';
import 'package:wizmo/utils/navigator_class.dart';
import 'package:wizmo/view/home_screens/home_screen/car_detail_screen/car_detail_initials.dart';
import 'package:wizmo/view/home_screens/home_screen/car_detail_screen/car_detail_screen.dart';
import 'package:wizmo/view/home_screens/home_screen/car_detail_screen/story_page.dart';
import 'package:wizmo/view/home_screens/main_bottom_bar/main_bottom_bar.dart';

class SaveProvider with ChangeNotifier {
  bool _loading = false;
  bool _isLogIn = false;
  bool get isLogIn => _isLogIn;
  bool get loading => _loading;
  Authentication authentication = Authentication();
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
      _loading = false;
      notifyListeners();
    } else {
      navigateToHome(context);
    }
  }

  navigateToHome(context) async {
    Navigation().pushRep(MainBottomBar(provider: getIt()), context);
    await FlushBarUtils.flushBar(
        'Login required to see the saved cars', context, 'Login Required');
  }
}
