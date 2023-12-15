import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:wizmo/domain/app_repository.dart';
import 'package:wizmo/main.dart';
import 'package:wizmo/models/user_profile.dart';
import 'package:wizmo/res/authentication/authentication.dart';
import 'package:wizmo/utils/navigator_class.dart';
import 'package:wizmo/view/home_screens/home_screen/home_initial_params.dart';
import 'package:wizmo/view/home_screens/main_bottom_bar/main_bottom_bar.dart';
import 'package:wizmo/view/login_signup/forget_password/forget_password.dart';
import 'package:wizmo/view/login_signup/signup/signup.dart';

class LoginProvider extends ChangeNotifier {
  AppRepository appRepository;
  LoginProvider({required this.appRepository});
  var passwordController =
      TextEditingController(text: kDebugMode ? '12345678' : null);
  var emailController =
      TextEditingController(text: kDebugMode ? 'usama1@gmail.com' : null);
  bool _loading = false;
  bool get loading => _loading;
  bool _obscure = true;
  bool get obscure => _obscure;

  navigateToSignup(BuildContext context) {
    Navigation().push(SignUp(provider: getIt()), context);
  }

  passHide() {
    obscure ? _obscure = false : _obscure = true;
    notifyListeners();
  }

  Authentication authentication = Authentication();
  login({required loginDetails, required url, required context}) async {
    _loading = true;
    notifyListeners();
    UserProfile userProfile;
    var response = await appRepository.post(
        url: url, context: context, details: loginDetails);
    print("response$response");
    if (response != null) {
      userProfile = UserProfile.fromJson(response);
      if (userProfile.token != null) {
        await authentication.saveToken(token: userProfile.token.toString());
        await authentication.saveLogin(true);
        navigateToHomeScreen(context, HomeInitialParams(provider: getIt()));
      }
      _loading = false;
    }
    _loading = false;
    notifyListeners();
  }

  navigateToHomeScreen(BuildContext context, HomeInitialParams initialParams) {
    Navigation().pushRep(MainBottomBar(provider: getIt()), context);
  }

  navigateToForgetPassword(BuildContext context) {
    Navigation().push(const ForgetPassword(), context);
  }
}
