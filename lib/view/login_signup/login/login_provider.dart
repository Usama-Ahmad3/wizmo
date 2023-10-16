import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:wizmo/view/home_screens/home_screen/home_initial_params.dart';

import '../../../res/routes/route_name.dart';

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
    Navigator.pushReplacementNamed(context, RouteName.signup);
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
      Navigator.pushReplacementNamed(
        context,
        RouteName.mainBottomBar,
        arguments: initialParams,
      );
      _loading = false;
    });
    notifyListeners();
  }
}
