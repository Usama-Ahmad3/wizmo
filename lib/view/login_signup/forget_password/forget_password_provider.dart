import 'package:flutter/cupertino.dart';
import 'package:wizmo/domain/app_repository.dart';
import 'package:wizmo/main.dart';
import 'package:wizmo/utils/navigator_class.dart';
import 'package:wizmo/view/login_signup/login/login.dart';
import 'package:wizmo/view/login_signup/signup/signup.dart';

class ForgetPasswordProvider with ChangeNotifier {
  AppRepository appRepository;
  ForgetPasswordProvider({required this.appRepository});
  final emailController = TextEditingController();

  forgetPassword(Map detail, String url, BuildContext context) {
    appRepository
        .post(url: url, context: context, details: detail)
        .then((value) {
      navigateToLogin(context);
    });
  }

  navigateToSignup(context) {
    Navigation().pushRep(SignUp(provider: getIt()), context);
  }

  navigateToLogin(BuildContext context) {
    Navigation().pushRep(LogIn(provider: getIt()), context);
  }
}
