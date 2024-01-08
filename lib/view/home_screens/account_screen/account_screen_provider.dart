import 'package:flutter/cupertino.dart';
import 'package:wizmo/models/get_profile.dart';
import 'package:wizmo/models/user_profile.dart';
import 'package:wizmo/domain/app_repository.dart';
import 'package:wizmo/main.dart';
import 'package:wizmo/res/app_urls/app_urls.dart';
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
  GetProfile profile = GetProfile();
  Authentication authentication = Authentication();
  bool _isLogIn = false;
  bool _loading = true;
  bool get loading => _loading;
  bool get isLogIn => _isLogIn;
  navigateToSignup(context) {
    Navigation().push(SignUp(provider: getIt()), context);
  }

  navigateToLogin(context) {
    Navigation().pushRep(LogIn(provider: getIt()), context);
  }

  Future checkAuth(BuildContext context) async {
    print('working');
    _loading = true;
    _isLogIn = await authentication.getAuth();
    print(await authentication.getToken());
    print("LAAAAAAAAAS$isLogIn");
    isLogIn
        // ignore: use_build_context_synchronously
        ? getProfile(
            details: null,
            context: context,
            url: '${AppUrls.baseUrl}${AppUrls.profile}')
        : null;
    _loading = false;
    notifyListeners();
    return profile;
  }

  navigateToHomeScreen(context) {
    Navigation().pushRep(MainBottomBar(provider: getIt(), index: 0), context);
  }

  logout(
      {required BuildContext context,
      required String url,
      Map? details}) async {
    await appRepository
        .post(url: url, context: context, details: details)
        .then((value) async {
      authentication.logout();
      await FlushBarUtils.flushBar(value['message'], context, 'Logout');
      navigateToHomeScreen(context);
    });
  }

  deleteAccount(
      {required BuildContext context,
      required String url,
      Map? details}) async {
    await appRepository
        .post(url: url, context: context, details: details)
        .then((value) async {
      authentication.logout();
      // await FlushBarUtils.flushBar(value['message'], context, 'Logout');
      navigateToHomeScreen(context);
    });
  }

  Future getProfile(
      {required BuildContext context,
      required String url,
      Map? details}) async {
    var response =
        await appRepository.post(url: url, context: context, details: details);
    print(response);
    if (response != null) {
      profile = await GetProfile.fromJson(response);
    } else {
      _loading = false;
      // ignore: use_build_context_synchronously
      navigateToHomeScreen(context);
      notifyListeners();
    }
    _loading = false;
    notifyListeners();
  }

  navigateToEditProfile(context, UserProfil profile) {
    Navigation().push(EditProfile(profile: profile), context);
  }

  navigateToMyCars(context) {
    Navigation().push(ViewMyCars(), context);
  }

  navigateToSavedCars(context) {
    Navigation().pushRep(MainBottomBar(provider: getIt(), index: 3), context);
  }
}
