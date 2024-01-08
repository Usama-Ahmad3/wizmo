import 'package:flutter/material.dart';
import 'package:wizmo/domain/app_repository.dart';
import 'package:wizmo/main.dart';
import 'package:wizmo/models/selling_models/body_typee.dart';
import 'package:wizmo/models/selling_models/car_acceleration.dart';
import 'package:wizmo/models/selling_models/car_co2.dart';
import 'package:wizmo/models/selling_models/car_model.dart';
import 'package:wizmo/models/selling_models/car_year.dart';
import 'package:wizmo/models/selling_models/drive_train.dart';
import 'package:wizmo/models/selling_models/make_model.dart';
import 'package:wizmo/models/selling_models/model_variation.dart';
import 'package:wizmo/models/sell_car_model.dart';
import 'package:wizmo/models/selling_models/type_seller.dart';
import 'package:wizmo/res/authentication/authentication.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/utils/flushbar.dart';
import 'package:wizmo/utils/navigator_class.dart';
import 'package:wizmo/view/home_screens/main_bottom_bar/main_bottom_bar.dart';
import 'package:wizmo/view/home_screens/sell_screen/about_your_car/about_your_car.dart';

import 'map_screen/map_screen.dart';

class SellScreenProvider extends ChangeNotifier {
  AppRepository appRepository;
  SellScreenProvider({required this.appRepository});
  final nameController = TextEditingController();
  final makeController = TextEditingController();
  final modelController = TextEditingController();
  final modelVariationController = TextEditingController();
  final yearController = TextEditingController();
  final sellerTypeController = TextEditingController();
  final bodyTypeController = TextEditingController();
  final co2Controller = TextEditingController();
  final accelerationController = TextEditingController();
  final driveTrainController = TextEditingController();
  final registrationController = TextEditingController();
  final priceController = TextEditingController();
  final locationController = TextEditingController();
  final descriptionController = TextEditingController();
  Authentication authentication = Authentication();
  SellCarModel sellCarModel = SellCarModel();
  @override
  void dispose() {
    nameController.dispose();
    modelController.dispose();
    modelVariationController.dispose();
    yearController.dispose();
    bodyTypeController.dispose();
    accelerationController.dispose();
    driveTrainController.dispose();
    co2Controller.dispose();
    sellerTypeController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  bool _isLogIn = false;
  bool _loading = false;
  MakeModel makeModel = MakeModel();
  CarModel carModel = CarModel();
  ModelVariation modelVariation = ModelVariation();
  CarYear carYear = CarYear();
  BodyTypee bodyTypee = BodyTypee();
  CarAcceleration acceleration = CarAcceleration();
  DriveTrain driveTrain = DriveTrain();
  CarCo2 carCo2 = CarCo2();
  TypeSeller typeSeller = TypeSeller();

  bool get loading => _loading;

  bool get isLogIn => _isLogIn;
  Future getMake(
      {required loginDetails, required url, required context}) async {
    _loading = true;
    notifyListeners();
    var response = await appRepository.post(
        url: url, context: context, details: loginDetails);
    print("response$response");
    if (response != null) {
      makeModel = MakeModel.fromJson(response);
      print(makeModel.make![0].name);
    }
    _loading = false;
    notifyListeners();
  }

  Future getModel(
      {required loginDetails, required url, required context}) async {
    _loading = true;
    notifyListeners();
    var response = await appRepository.post(
        url: url, context: context, details: loginDetails);
    print("response$response");
    if (response != null) {
      carModel = CarModel.fromJson(response);
    }
    _loading = false;
    notifyListeners();
  }

  Future getModelVariation(
      {required loginDetails, required url, required context}) async {
    _loading = true;
    notifyListeners();
    var response = await appRepository.post(
        url: url, context: context, details: loginDetails);
    print("response$response");
    if (response != null) {
      modelVariation = ModelVariation.fromJson(response);
    }
    _loading = false;
    notifyListeners();
  }

  Future getYear(
      {required loginDetails, required url, required context}) async {
    _loading = true;
    notifyListeners();
    var response = await appRepository.post(
        url: url, context: context, details: loginDetails);
    print("response$response");
    if (response != null) {
      carYear = CarYear.fromJson(response);
    }
    _loading = false;
    notifyListeners();
  }

  Future getBodyType(
      {required loginDetails, required url, required context}) async {
    _loading = true;
    notifyListeners();
    var response = await appRepository.post(
        url: url, context: context, details: loginDetails);
    print("response$response");
    if (response != null) {
      bodyTypee = BodyTypee.fromJson(response);
    }
    _loading = false;
    notifyListeners();
  }

  Future getAcceleration(
      {required loginDetails, required url, required context}) async {
    _loading = true;
    notifyListeners();
    var response = await appRepository.post(
        url: url, context: context, details: loginDetails);
    print("response$response");
    if (response != null) {
      acceleration = CarAcceleration.fromJson(response);
    }
    _loading = false;
    notifyListeners();
  }

  Future getDriveTrain(
      {required loginDetails, required url, required context}) async {
    _loading = true;
    notifyListeners();
    var response = await appRepository.post(
        url: url, context: context, details: loginDetails);
    print("response$response");
    if (response != null) {
      driveTrain = DriveTrain.fromJson(response);
    }
    _loading = false;
    notifyListeners();
  }

  Future getCo2({required loginDetails, required url, required context}) async {
    _loading = true;
    notifyListeners();
    var response = await appRepository.post(
        url: url, context: context, details: loginDetails);
    print("response$response");
    if (response != null) {
      carCo2 = CarCo2.fromJson(response);
    }
    _loading = false;
    notifyListeners();
  }

  Future getSellerType(
      {required loginDetails, required url, required context}) async {
    _loading = true;
    notifyListeners();
    var response = await appRepository.post(
        url: url, context: context, details: loginDetails);
    print("response$response");
    if (response != null) {
      typeSeller = TypeSeller.fromJson(response);
    }
    _loading = false;
    notifyListeners();
  }

  selectChoice(Size size, BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Select $title',
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: AppColors.white),
        ),
        elevation: 5,
        backgroundColor: AppColors.shadowColor.withOpacity(0.1),
        contentPadding: EdgeInsets.symmetric(
            vertical: size.height * 0.03, horizontal: size.width * 0.01),
        content: SizedBox(
          height: size.height * 0.45,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...List.generate(
                    title == 'Make'
                        ? makeModel.make!.length
                        : title == 'Model'
                            ? carModel.model!.length
                            : title == 'Variation'
                                ? modelVariation.modelVarition!.length
                                : title == 'Year'
                                    ? carYear.year!.length
                                    : title == 'body_type'
                                        ? bodyTypee.bodyType!.length
                                        : title == 'Acceleration'
                                            ? acceleration.acceleration!.length
                                            : title == 'Drivetrain'
                                                ? driveTrain.drivetrain!.length
                                                : title == 'Co2'
                                                    ? carCo2.co2!.length
                                                    : typeSeller
                                                        .sellerType!.length,
                    (index) => InkWell(
                          onTap: () {
                            if (title == 'Make') {
                              makeController.text =
                                  makeModel.make![index].name.toString();
                              sellCarModel.make =
                                  makeModel.make![index].name.toString();
                            } else if (title == 'Model') {
                              modelController.text =
                                  carModel.model![index].model.toString();
                              sellCarModel.model =
                                  carModel.model![index].model.toString();
                            } else if (title == 'body_type') {
                              bodyTypeController.text = bodyTypee
                                  .bodyType![index].bodyType
                                  .toString();
                              sellCarModel.bodyType = bodyTypee
                                  .bodyType![index].bodyType
                                  .toString();
                            } else if (title == 'Acceleration') {
                              accelerationController.text = acceleration
                                  .acceleration![index].acceleration
                                  .toString();
                              sellCarModel.acceleration = acceleration
                                  .acceleration![index].acceleration
                                  .toString();
                            } else if (title == 'Drivetrain') {
                              driveTrainController.text = driveTrain
                                  .drivetrain![index].drivetrain
                                  .toString();
                              sellCarModel.driveTrain = driveTrain
                                  .drivetrain![index].drivetrain
                                  .toString();
                            } else if (title == 'Variation') {
                              modelVariationController.text = modelVariation
                                  .modelVarition![index].variationName
                                  .toString();
                              sellCarModel.variation = modelVariation
                                  .modelVarition![index].variationName
                                  .toString();
                            } else if (title == 'Year') {
                              yearController.text =
                                  carYear.year![index].yearName.toString();
                              sellCarModel.year =
                                  carYear.year![index].yearName.toString();
                            } else if (title == 'Seller') {
                              sellerTypeController.text = typeSeller
                                  .sellerType![index].sellerType
                                  .toString();
                              sellCarModel.sellerType = typeSeller
                                  .sellerType![index].sellerType
                                  .toString();
                            } else {
                              co2Controller.text =
                                  carCo2.co2![index].co.toString();
                              sellCarModel.co2 =
                                  carCo2.co2![index].co.toString();
                            }
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.003),
                            child: Container(
                                height: size.height * 0.07,
                                width: size.width,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColors.shadowColor
                                            .withOpacity(0.17),
                                        blurStyle: BlurStyle.normal,
                                        offset: const Offset(1, 1),
                                        blurRadius: 5,
                                        spreadRadius: 1)
                                  ],
                                  color: AppColors.buttonColor.withOpacity(0.7),
                                  borderRadius:
                                      BorderRadius.circular(size.height * 0.01),
                                  border:
                                      Border.all(color: AppColors.transparent),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.04),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        title == 'Make'
                                            ? makeModel.make![index].name
                                                .toString()
                                            : title == "Model"
                                                ? carModel.model![index].model
                                                    .toString()
                                                : title == 'Acceleration'
                                                    ? acceleration
                                                        .acceleration![index]
                                                        .acceleration
                                                        .toString()
                                                    : title == 'Variation'
                                                        ? modelVariation
                                                            .modelVarition![
                                                                index]
                                                            .variationName
                                                            .toString()
                                                        : title == 'Year'
                                                            ? carYear
                                                                .year![index]
                                                                .yearName
                                                                .toString()
                                                            : title ==
                                                                    'body_type'
                                                                ? bodyTypee
                                                                    .bodyType![
                                                                        index]
                                                                    .bodyType
                                                                    .toString()
                                                                : title ==
                                                                        'Drivetrain'
                                                                    ? driveTrain
                                                                        .drivetrain![
                                                                            index]
                                                                        .drivetrain
                                                                        .toString()
                                                                    : title ==
                                                                            'Co2'
                                                                        ? carCo2
                                                                            .co2![
                                                                                index]
                                                                            .co
                                                                            .toString()
                                                                        : typeSeller
                                                                            .sellerType![index]
                                                                            .sellerType
                                                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3!
                                            .copyWith(color: AppColors.white),
                                      ),
                                      Text('tap to select',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4!
                                              .copyWith(
                                                  color: AppColors.white)),
                                    ],
                                  ),
                                )),
                          ),
                        ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  checkAuth(context) async {
    _loading = true;
    _isLogIn = await authentication.getAuth();
    print(await authentication.getToken());
    if (isLogIn) {
      _loading = false;
      notifyListeners();
    } else {
      navigateToHome(context);
    }
  }

  navigateToHome(context) async {
    Navigation().pushRep(MainBottomBar(provider: getIt(), index: 0), context);
    await FlushBarUtils.flushBar(
        'Login required to add car for sale', context, 'Login Required');
  }

  navigateToAboutCar(context) {
    sellCarModel.carName = nameController.text;
    sellCarModel.registration = registrationController.text;
    sellCarModel.price = priceController.text;
    sellCarModel.description = descriptionController.text;
    sellCarModel.location = locationController.text;
    print(sellCarModel.description);
    print(sellCarModel.carName);
    print(descriptionController.text);
    Navigation().push(
        AboutYourCar(provider: getIt(), sellCarModel: sellCarModel), context);
  }

  navigateToMap(BuildContext context) {
    Navigation().push(
        MapScreen(location: locationController, sellCarModel: sellCarModel),
        context);
  }
}
