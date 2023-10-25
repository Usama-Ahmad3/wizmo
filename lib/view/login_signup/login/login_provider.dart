import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:wizmo/main.dart';
import 'package:wizmo/utils/navigator_class.dart';
import 'package:wizmo/view/home_screens/home_screen/home_initial_params.dart';
import 'package:wizmo/view/home_screens/main_bottom_bar/main_bottom_bar.dart';
import 'package:wizmo/view/login_signup/signup/signup.dart';

class LoginProvider extends ChangeNotifier {
  var passwordController =
      TextEditingController(text: kDebugMode ? '12345678' : null);
  var emailController =
      TextEditingController(text: kDebugMode ? 'admin@gmail.com' : null);
  bool _loading = false;
  bool get loading => _loading;
  bool _obscure = true;
  bool get obscure => _obscure;

  navigateToSignup(BuildContext context) {
    NavigatorClass().navigatorPush(SignUp(provider: getIt()), context);
  }

  passHide() {
    obscure ? _obscure = false : _obscure = true;
    notifyListeners();
  }

  navigateToHomeScreen(BuildContext context, HomeInitialParams initialParams) {
    _loading = true;
    // ignore: prefer_const_constructors
    Future.delayed(Duration(seconds: 2), () {
      _loading = false;
      NavigatorClass()
          .navigatorPushReplacment(MainBottomBar(provider: getIt()), context);
      _loading = false;
    });
    notifyListeners();
  }
}
