import 'package:flutter/material.dart';
import 'package:wizmo/res/routes/route_name.dart';
import 'package:wizmo/view/home_screens/home_screen/home_initial_params.dart';
import 'package:wizmo/view/home_screens/home_screen/home_page.dart';
import 'package:wizmo/view/home_screens/main_bottom_bar/main_bottom_bar.dart';
import 'package:wizmo/view/login_signup/login/login.dart';
import 'package:wizmo/view/login_signup/login/login_provider.dart';
import 'package:wizmo/view/login_signup/signup/signup.dart';
import 'package:wizmo/view/onboarding/first.dart';
import 'package:wizmo/view/onboarding/main_onboarding.dart';
import 'package:wizmo/view/onboarding/second.dart';
import 'package:wizmo/view/onboarding/third.dart';

import '../../main.dart';

class AppRoutes {
  static MaterialPageRoute generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      ///onboarding
      case RouteName.mainOnboarding:
        return MaterialPageRoute(builder: (context) => MainOnBoarding());
      case RouteName.login:
        return MaterialPageRoute(
            builder: (context) => LogIn(
                  provider: getIt(),
                ));
      case RouteName.signup:
        return MaterialPageRoute(
            builder: (context) => SignUp(
                  provider: getIt(),
                ));
      case RouteName.mainBottomBar:
        return MaterialPageRoute(
          builder: (context) => const MainBottomBar(),
        );
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text('Routes Not Defined'),
                  ),
                ));
    }
  }
}
