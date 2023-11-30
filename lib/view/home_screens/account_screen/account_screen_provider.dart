import 'package:flutter/cupertino.dart';
import 'package:wizmo/main.dart';
import 'package:wizmo/utils/navigator_class.dart';
import 'package:wizmo/view/home_screens/account_screen/edit_profile/edit_profile.dart';
import 'package:wizmo/view/home_screens/main_bottom_bar/main_bottom_bar.dart';
import 'package:wizmo/view/home_screens/save_screen/save_screen.dart';
import 'package:wizmo/view/login_signup/login/login.dart';
import 'package:wizmo/view/login_signup/signup/signup.dart';

import 'view_my_cars/view_my_cars.dart';

class AccountScreenProvider with ChangeNotifier {
  navigateToSignup(context) {
    Navigation().push(SignUp(provider: getIt()), context);
  }

  navigateToLogin(context) {
    Navigation().push(LogIn(provider: getIt()), context);
  }

  navigateToEditProfile(context) {
    Navigation().push(const EditProfile(), context);
  }

  navigateToMyCars(context) {
    Navigation().push(const ViewMyCars(), context);
  }

  navigateToSavedCars(context) {
    Navigation().pushRep(MainBottomBar(provider: getIt(), index: 3), context);
  }
}
