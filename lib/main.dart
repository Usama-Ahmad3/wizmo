import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wizmo/domain/app_repository.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/res/exception/error_widget.dart';
import 'package:wizmo/view/home_screens/account_screen/edit_profile/edit_profile_provider.dart';
import 'package:wizmo/view/home_screens/account_screen/view_my_cars/view_my_cars_provider.dart';
import 'package:wizmo/view/home_screens/home_screen/car_detail_screen/car_detail_provider.dart';
import 'package:wizmo/view/home_screens/home_screen/home_provider.dart';
import 'package:wizmo/view/home_screens/main_bottom_bar/main_bottom_bar.dart';
import 'package:wizmo/view/home_screens/main_bottom_bar/main_bottom_bar_provider.dart';
import 'package:wizmo/view/home_screens/save_screen/save_provider.dart';
import 'package:wizmo/view/home_screens/sell_screen/about_your_car/about_your_car_provider.dart';
import 'package:wizmo/view/home_screens/sell_screen/add_photo/add_photo_provider.dart';
import 'package:wizmo/view/home_screens/sell_screen/sell_screen/map_screen/map_screen_provider.dart';
import 'package:wizmo/view/home_screens/sell_screen/sell_screen/sell_screen_provider.dart';
import 'package:wizmo/view/login_signup/forget_password/forget_password_provider.dart';
import 'package:wizmo/view/login_signup/login/login_provider.dart';
import 'package:wizmo/view/login_signup/signup/signup_provider.dart';
import 'package:wizmo/view/onboarding/onboarding_provider.dart';
import 'data/get_repository.dart';
import 'view/home_screens/account_screen/account_screen_provider.dart';
import 'view/onboarding/main_onboarding.dart';

GetIt getIt = GetIt.instance;
void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // ErrorWidget.builder = (FlutterErrorDetails detail) {
  //   return ErrorWidgetScreen(error: detail.exception.toString());
  // };
  getIt.registerLazySingleton<AppRepository>(() => GetRepository());
  getIt.registerSingleton<AccountScreenProvider>(
      AccountScreenProvider(appRepository: getIt()));
  getIt.registerSingleton<LoginProvider>(LoginProvider(appRepository: getIt()));
  getIt.registerSingleton<SignUpProvider>(
      SignUpProvider(appRepository: getIt()));
  getIt.registerSingleton<HomeProvider>(HomeProvider(appRepository: getIt()));
  getIt.registerSingleton<SellScreenProvider>(
      SellScreenProvider(appRepository: getIt()));
  getIt.registerSingleton<MainBottomBarProvider>(MainBottomBarProvider());
  getIt.registerSingleton<MapScreenProvider>(MapScreenProvider());
  getIt.registerSingleton<AboutYourCarProvider>(
      AboutYourCarProvider(appRepository: getIt()));
  getIt.registerSingleton<AddPhotoProvider>(
      AddPhotoProvider(appRepository: getIt()));
  getIt.registerSingleton<SaveProvider>(SaveProvider());
  getIt.registerSingleton<ViewMyCarsProvider>(
      ViewMyCarsProvider(appRepository: getIt()));
  getIt.registerSingleton<CarDetailProvider>(
      CarDetailProvider(appRepository: getIt()));
  getIt.registerSingleton<EditProfileProvider>(
      EditProfileProvider(appRepository: getIt()));
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool walk = false;
  bool isLogin = false;
  load() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      walk = pref.getBool("walk") ?? false;
      isLogin = pref.getBool('login') ?? false;
    });
  }

  @override
  void initState() {
    load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: MyApp(
        walk: walk,
        isLogin: isLogin,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  bool walk;
  bool isLogin;
  MyApp({super.key, required this.walk, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => LoginProvider(appRepository: getIt())),
        ChangeNotifierProvider(
            create: (context) => SignUpProvider(appRepository: getIt())),
        ChangeNotifierProvider(create: (context) => OnBoardingProvider()),
        ChangeNotifierProvider(create: (context) => MainBottomBarProvider()),
        ChangeNotifierProvider(
            create: (context) => SellScreenProvider(appRepository: getIt())),
        ChangeNotifierProvider(
            create: (context) => EditProfileProvider(appRepository: getIt())),
        ChangeNotifierProvider(
            create: (context) => AboutYourCarProvider(appRepository: getIt())),
        ChangeNotifierProvider(
            create: (context) => ViewMyCarsProvider(appRepository: getIt())),
        ChangeNotifierProvider(
            create: (context) => AddPhotoProvider(appRepository: getIt())),
        ChangeNotifierProvider(
            create: (context) =>
                ForgetPasswordProvider(appRepository: getIt())),
        ChangeNotifierProvider(create: (context) => SaveProvider()),
        ChangeNotifierProvider(
            create: (context) => CorouselProvider(appRepository: getIt())),
        ChangeNotifierProvider(
            create: (context) => AccountScreenProvider(appRepository: getIt())),
        ChangeNotifierProvider(
            create: (context) => HomeProvider(appRepository: getIt())),
        ChangeNotifierProvider(
            create: (context) => CarDetailProvider(appRepository: getIt())),
        ChangeNotifierProvider(create: (context) => MapScreenProvider()),
      ],
      child: MaterialApp(
        title: 'Wizmo',
        color: AppColors.white,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.white),
            useMaterial3: true,
            textTheme: TextTheme(
                // titleMedium:
                //     TextStyle(color: AppColors.black, fontSize: height * 0.04),
                headline1:
                    TextStyle(color: AppColors.black, fontSize: height * 0.06),
                headline2:
                    TextStyle(color: Colors.grey, fontSize: height * 0.03),
                headline3:
                    TextStyle(color: Colors.grey, fontSize: height * 0.018),
                headline4: TextStyle(
                    color: AppColors.grey, fontSize: height * 0.017))),
        home: walk
            ? MainBottomBar(
                provider: getIt(),
                index: 0,
              )
            : MainOnBoarding(),
      ),
    );
  }
}
