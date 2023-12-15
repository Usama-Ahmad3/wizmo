import 'package:flutter/cupertino.dart';
import 'package:wizmo/domain/app_repository.dart';
import 'package:wizmo/main.dart';
import 'package:wizmo/models/user_profile.dart';
import 'package:wizmo/res/authentication/authentication.dart';
import 'package:wizmo/utils/flushbar.dart';
import 'package:wizmo/utils/navigator_class.dart';
import 'package:wizmo/view/home_screens/account_screen/edit_profile/edit_profile.dart';
import 'package:wizmo/view/home_screens/main_bottom_bar/main_bottom_bar.dart';
import 'package:wizmo/view/login_signup/login/login.dart';
import 'package:wizmo/view/login_signup/signup/signup.dart';

import 'view_my_cars/view_my_cars.dart';

class AccountScreenProvider with ChangeNotifier {
  AppRepository appRepository;
  AccountScreenProvider({required this.appRepository});
  UserProfile userProfile = UserProfile();
  Authentication authentication = Authentication();
  bool _isLogIn = false;
  bool _loading = false;
  bool get loading => _loading;
  bool get isLogIn => _isLogIn;
  navigateToSignup(context) {
    Navigation().push(SignUp(provider: getIt()), context);
  }

  navigateToLogin(context) {
    Navigation().pushRep(LogIn(provider: getIt()), context);
  }

  checkAuth() async {
    print('working');
    _loading = true;
    _isLogIn = await authentication.getAuth();
    print(await authentication.getToken());
    print("LAAAAAAAAAS$isLogIn");
    _loading = false;
    notifyListeners();
  }

  navigateToHomeScreen(context) {
    Navigation().pushRep(MainBottomBar(provider: getIt(), index: 0), context);
  }

  logout({required BuildContext context, required String url, Map? details}) {
    appRepository
        .post(url: url, context: context, details: details)
        .then((value) async {
      authentication.logout();
      await FlushBarUtils.flushBar(value['message'], context, 'Logout');
      navigateToHomeScreen(context);
    });
  }

  navigateToEditProfile(context) {
    Navigation().push(const EditProfile(), context);
  }

  navigateToMyCars(context) {
    Navigation().push(ViewMyCars(), context);
  }

  navigateToSavedCars(context) {
    Navigation().pushRep(MainBottomBar(provider: getIt(), index: 3), context);
  }
}
