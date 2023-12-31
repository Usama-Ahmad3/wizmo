import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:wizmo/domain/app_repository.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/view/home_screens/account_screen/edit_profile/edit_profile_provider.dart';
import 'package:wizmo/view/home_screens/home_screen/car_detail_screen/car_detail_provider.dart';
import 'package:wizmo/view/home_screens/home_screen/home_provider.dart';
import 'package:wizmo/view/home_screens/main_bottom_bar/main_bottom_bar_provider.dart';
import 'package:wizmo/view/home_screens/save_screen/save_provider.dart';
import 'package:wizmo/view/home_screens/sell_screen/about_your_car/about_your_car_provider.dart';
import 'package:wizmo/view/home_screens/sell_screen/add_photo/add_photo_provider.dart';
import 'package:wizmo/view/home_screens/sell_screen/sell_screen/sell_screen_provider.dart';
import 'package:wizmo/view/login_signup/login/login_provider.dart';
import 'package:wizmo/view/login_signup/signup/signup_provider.dart';
import 'package:wizmo/view/onboarding/onboarding_provider.dart';
import 'data/get_repository.dart';
import 'view/home_screens/account_screen/account_screen_provider.dart';
import 'view/onboarding/main_onboarding.dart';

GetIt getIt = GetIt.instance;
void main() {
  getIt.registerLazySingleton<AppRepository>(() => GetRepository());
  getIt.registerSingleton<AccountScreenProvider>(AccountScreenProvider());
  getIt.registerSingleton<LoginProvider>(LoginProvider());
  getIt.registerSingleton<SignUpProvider>(SignUpProvider());
  getIt.registerSingleton<HomeProvider>(HomeProvider(appRepository: getIt()));
  getIt.registerSingleton<SellScreenProvider>(SellScreenProvider());
  getIt.registerSingleton<MainBottomBarProvider>(MainBottomBarProvider());
  getIt.registerSingleton<AboutYourCarProvider>(AboutYourCarProvider());
  getIt.registerSingleton<AddPhotoProvider>(AddPhotoProvider());
  getIt.registerSingleton<SaveProvider>(SaveProvider());
  getIt.registerSingleton<CarDetailProvider>(CarDetailProvider());
  getIt.registerSingleton<EditProfileProvider>(EditProfileProvider());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => SignUpProvider()),
        ChangeNotifierProvider(create: (context) => OnBoardingProvider()),
        ChangeNotifierProvider(create: (context) => MainBottomBarProvider()),
        ChangeNotifierProvider(create: (context) => SellScreenProvider()),
        ChangeNotifierProvider(create: (context) => EditProfileProvider()),
        ChangeNotifierProvider(create: (context) => AboutYourCarProvider()),
        ChangeNotifierProvider(create: (context) => AddPhotoProvider()),
        ChangeNotifierProvider(create: (context) => SaveProvider()),
        ChangeNotifierProvider(create: (context) => AccountScreenProvider()),
        ChangeNotifierProvider(
            create: (context) => HomeProvider(appRepository: getIt())),
        ChangeNotifierProvider(create: (context) => CarDetailProvider()),
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
        home: MainOnBoarding(),
      ),
    );
  }
}
