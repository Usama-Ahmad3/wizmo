import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wizmo/domain/app_repository.dart';
import 'package:wizmo/res/authentication/authentication.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/view/home_screens/Favourites_Screens/favourites_provider.dart';
import 'package:wizmo/view/home_screens/account_screen/edit_profile/edit_profile_provider.dart';
import 'package:wizmo/view/home_screens/account_screen/view_my_cars/view_my_cars_provider.dart';
import 'package:wizmo/view/home_screens/home_screen/car_detail_screen/car_detail_provider.dart';
import 'package:wizmo/view/home_screens/home_screen/home_provider.dart';
import 'package:wizmo/view/home_screens/main_bottom_bar/main_bottom_bar.dart';
import 'package:wizmo/view/home_screens/main_bottom_bar/main_bottom_bar_provider.dart';
import 'package:wizmo/view/home_screens/save_screen/save_provider.dart';
import 'package:wizmo/view/home_screens/search_screen/filter_cars/filter_car_provider.dart';
import 'package:wizmo/view/home_screens/search_screen/search_provider.dart';
import 'package:wizmo/view/home_screens/sell_screen/about_your_car/about_your_car_provider.dart';
import 'package:wizmo/view/home_screens/sell_screen/add_photo/add_photo_provider.dart';
import 'package:wizmo/view/home_screens/sell_screen/sell_screen/map_screen/map_screen_provider.dart';
import 'package:wizmo/view/home_screens/sell_screen/sell_screen/sell_screen_provider.dart';
import 'package:wizmo/view/login_signup/forget_password/forget_password_provider.dart';
import 'package:wizmo/view/login_signup/login/login_provider.dart';
import 'package:wizmo/view/login_signup/signup/signup_provider.dart';
import 'package:wizmo/view/onboarding/onboarding_provider.dart';
import 'data/get_repository.dart';
import 'models/Car Favourites models/get_car_favourites.dart';
import 'models/Car Favourites models/post_car_favourites.dart';
import 'models/all_cars_home.dart';
import 'models/get_profile.dart';
import 'models/sell_car_model.dart';
import 'models/selling_models/body_typee.dart';
import 'models/selling_models/car_acceleration.dart';
import 'models/selling_models/car_co2.dart';
import 'models/selling_models/car_color.dart';
import 'models/selling_models/car_engine_power.dart';
import 'models/selling_models/car_engine_size.dart';
import 'models/selling_models/car_fuel_consumption.dart';
import 'models/selling_models/car_gearbox.dart';
import 'models/selling_models/car_model.dart';
import 'models/selling_models/car_year.dart';
import 'models/selling_models/doors.dart';
import 'models/selling_models/drive_train.dart';
import 'models/selling_models/insurance.dart';
import 'models/selling_models/make_model.dart';
import 'models/selling_models/mileage.dart';
import 'models/selling_models/model_variation.dart';
import 'models/selling_models/seats.dart';
import 'models/selling_models/tax.dart';
import 'models/selling_models/type_fuel.dart';
import 'models/selling_models/type_seller.dart';
import 'models/user_profile.dart';
import 'view/home_screens/account_screen/account_screen_provider.dart';
import 'view/onboarding/main_onboarding.dart';

GetIt getIt = GetIt.instance;
void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // ErrorWidget.builder = (FlutterErrorDetails detail) {
  //   return ErrorWidgetScreen(error: detail.exception.toString());
  // };
  getIt.registerLazySingleton<AppRepository>(() => GetRepository());
  getIt.registerLazySingleton<UserProfile>(() => UserProfile());
  getIt.registerLazySingleton<GetProfile>(() => GetProfile());
  getIt.registerLazySingleton<Authentication>(() => Authentication());
  getIt.registerLazySingleton<PostCarFavourites>(() => PostCarFavourites());
  getIt.registerLazySingleton<GetCarFavourites>(() => GetCarFavourites());
  getIt.registerLazySingleton<AllCarsHome>(() => AllCarsHome());
  getIt.registerLazySingleton<MakeModel>(() => MakeModel());
  getIt.registerLazySingleton<CarModel>(() => CarModel());
  getIt.registerLazySingleton<TypeFuel>(() => TypeFuel());
  getIt.registerLazySingleton<CarFuelConsumption>(() => CarFuelConsumption());
  getIt.registerLazySingleton<CarEngineSize>(() => CarEngineSize());
  getIt.registerLazySingleton<CarEnginePower>(() => CarEnginePower());
  getIt.registerLazySingleton<Mileage>(() => Mileage());
  getIt.registerLazySingleton<CarGearbox>(() => CarGearbox());
  getIt.registerLazySingleton<Doors>(() => Doors());
  getIt.registerLazySingleton<Seats>(() => Seats());
  getIt.registerLazySingleton<CarColor>(() => CarColor());
  getIt.registerLazySingleton<Tax>(() => Tax());
  getIt.registerLazySingleton<SearchProvider>(
      () => SearchProvider(appRepository: getIt(), carModel: getIt()));
  getIt.registerLazySingleton<Insurance>(() => Insurance());
  getIt.registerLazySingleton<SellCarModel>(() => SellCarModel());
  getIt.registerLazySingleton<CarYear>(() => CarYear());
  getIt.registerLazySingleton<ModelVariation>(() => ModelVariation());
  getIt.registerLazySingleton<CarAcceleration>(() => CarAcceleration());
  getIt.registerLazySingleton<BodyTypee>(() => BodyTypee());
  getIt.registerLazySingleton<DriveTrain>(() => DriveTrain());
  getIt.registerLazySingleton<CarCo2>(() => CarCo2());
  getIt.registerLazySingleton<TypeSeller>(() => TypeSeller());
  getIt.registerSingleton<AccountScreenProvider>(AccountScreenProvider(
      appRepository: getIt(),
      profile: getIt(),
      authentication: getIt(),
      userProfile: getIt()));
  getIt.registerSingleton<LoginProvider>(LoginProvider(appRepository: getIt()));
  getIt.registerSingleton<FilterCarProvider>(
      FilterCarProvider(appRepository: getIt(), myAllCarModel: getIt()));
  getIt.registerSingleton<SignUpProvider>(
      SignUpProvider(appRepository: getIt()));
  getIt.registerSingleton<HomeProvider>(HomeProvider(
      allCarsHome: getIt(),
      appRepository: getIt(),
      carModel: getIt(),
      makeModel: getIt()));
  getIt.registerSingleton<SellScreenProvider>(SellScreenProvider(
    appRepository: getIt(),
    authentication: getIt(),
    carModel: getIt(),
    makeModel: getIt(),
    sellCarModel: getIt(),
    acceleration: getIt(),
    bodyTypee: getIt(),
    carCo2: getIt(),
    carYear: getIt(),
    driveTrain: getIt(),
    modelVariation: getIt(),
    typeSeller: getIt(),
  ));
  getIt.registerSingleton<MainBottomBarProvider>(MainBottomBarProvider());
  getIt.registerSingleton<MapScreenProvider>(MapScreenProvider());
  getIt.registerSingleton<AboutYourCarProvider>(AboutYourCarProvider(
      appRepository: getIt(),
      carColor: getIt(),
      carEnginePower: getIt(),
      carEngineSize: getIt(),
      doors: getIt(),
      fuelConsumption: getIt(),
      gearbox: getIt(),
      insurance: getIt(),
      mileage: getIt(),
      seats: getIt(),
      tax: getIt(),
      typeFuel: getIt()));
  getIt.registerSingleton<AddPhotoProvider>(
      AddPhotoProvider(appRepository: getIt()));
  getIt.registerSingleton<CarFavouritesProvider>(CarFavouritesProvider(
      appRepository: getIt(),
      getCarFavourites: getIt(),
      postCarFavourites: getIt()));
  getIt.registerSingleton<SaveProvider>(SaveProvider(
      appRepository: getIt(),
      authentication: getIt(),
      getCarFavourites: getIt()));
  getIt.registerSingleton<ViewMyCarsProvider>(
      ViewMyCarsProvider(appRepository: getIt(), myAllCarModel: getIt()));
  getIt.registerSingleton<CarDetailProvider>(CarDetailProvider(
      appRepository: getIt(), profile: getIt(), authentication: getIt()));
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
  final bool walk;
  final bool isLogin;
  const MyApp({super.key, required this.walk, required this.isLogin});

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
        ChangeNotifierProvider(
            create: (context) => FilterCarProvider(
                myAllCarModel: getIt(), appRepository: getIt())),
        ChangeNotifierProvider(
            create: (context) =>
                SearchProvider(carModel: getIt(), appRepository: getIt())),
        ChangeNotifierProvider(create: (context) => MainBottomBarProvider()),
        ChangeNotifierProvider(
            create: (context) => SellScreenProvider(
                  appRepository: getIt(),
                  authentication: getIt(),
                  carModel: getIt(),
                  makeModel: getIt(),
                  sellCarModel: getIt(),
                  acceleration: getIt(),
                  bodyTypee: getIt(),
                  carCo2: getIt(),
                  carYear: getIt(),
                  driveTrain: getIt(),
                  modelVariation: getIt(),
                  typeSeller: getIt(),
                )),
        ChangeNotifierProvider(
            create: (context) => EditProfileProvider(appRepository: getIt())),
        ChangeNotifierProvider(
            create: (context) => AboutYourCarProvider(
                appRepository: getIt(),
                carColor: getIt(),
                carEnginePower: getIt(),
                carEngineSize: getIt(),
                doors: getIt(),
                fuelConsumption: getIt(),
                gearbox: getIt(),
                insurance: getIt(),
                mileage: getIt(),
                seats: getIt(),
                tax: getIt(),
                typeFuel: getIt())),
        ChangeNotifierProvider(
            create: (context) => ViewMyCarsProvider(
                appRepository: getIt(), myAllCarModel: getIt())),
        ChangeNotifierProvider(
            create: (context) => CarFavouritesProvider(
                appRepository: getIt(),
                postCarFavourites: getIt(),
                getCarFavourites: getIt())),
        ChangeNotifierProvider(
            create: (context) => AddPhotoProvider(appRepository: getIt())),
        ChangeNotifierProvider(
            create: (context) =>
                ForgetPasswordProvider(appRepository: getIt())),
        ChangeNotifierProvider(
            create: (context) => SaveProvider(
                appRepository: getIt(),
                getCarFavourites: getIt(),
                authentication: getIt())),
        ChangeNotifierProvider(
            create: (context) =>
                CorouselProvider(appRepository: getIt(), allCarsHome: getIt())),
        ChangeNotifierProvider(
            create: (context) => AccountScreenProvider(
                appRepository: getIt(),
                userProfile: getIt(),
                authentication: getIt(),
                profile: getIt())),
        ChangeNotifierProvider(
            create: (context) => HomeProvider(
                allCarsHome: getIt(),
                appRepository: getIt(),
                makeModel: getIt(),
                carModel: getIt())),
        ChangeNotifierProvider(
            create: (context) => CarDetailProvider(
                appRepository: getIt(),
                profile: getIt(),
                authentication: getIt())),
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
