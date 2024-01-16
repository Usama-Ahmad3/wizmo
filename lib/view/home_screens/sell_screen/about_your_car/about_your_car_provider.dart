import 'package:flutter/material.dart';
import 'package:wizmo/domain/app_repository.dart';
import 'package:wizmo/main.dart';
import 'package:wizmo/models/selling_models/car_color.dart';
import 'package:wizmo/models/selling_models/car_engine_power.dart';
import 'package:wizmo/models/selling_models/car_engine_size.dart';
import 'package:wizmo/models/selling_models/car_fuel_consumption.dart';
import 'package:wizmo/models/selling_models/car_gearbox.dart';
import 'package:wizmo/models/selling_models/doors.dart';
import 'package:wizmo/models/selling_models/insurance.dart';
import 'package:wizmo/models/selling_models/mileage.dart';
import 'package:wizmo/models/selling_models/seats.dart';
import 'package:wizmo/models/sell_car_model.dart';
import 'package:wizmo/models/selling_models/tax.dart';
import 'package:wizmo/models/selling_models/type_fuel.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/utils/navigator_class.dart';
import 'package:wizmo/view/home_screens/sell_screen/add_photo/add_photo.dart';

class AboutYourCarProvider with ChangeNotifier {
  AppRepository appRepository;
  TypeFuel typeFuel;
  CarFuelConsumption fuelConsumption;
  CarEngineSize carEngineSize;
  CarEnginePower carEnginePower;
  Mileage mileage;
  CarGearbox gearbox;
  Doors doors;
  Seats seats;
  CarColor carColor;
  Tax tax;
  Insurance insurance;

  AboutYourCarProvider({
    required this.appRepository,
    required this.typeFuel,
    required this.fuelConsumption,
    required this.carEngineSize,
    required this.carEnginePower,
    required this.mileage,
    required this.gearbox,
    required this.doors,
    required this.seats,
    required this.carColor,
    required this.tax,
    required this.insurance,
  });

  ///aboutCarDetail
  TextEditingController engineController = TextEditingController();
  TextEditingController fuelController = TextEditingController();
  TextEditingController insuranceController = TextEditingController();
  TextEditingController taxController = TextEditingController();
  TextEditingController fuelConsumptionController = TextEditingController();
  TextEditingController powerController = TextEditingController();
  TextEditingController mileageController = TextEditingController();
  TextEditingController gearBoxController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController doorsController = TextEditingController();
  TextEditingController seatsController = TextEditingController();
  TextEditingController rangeController = TextEditingController();
  // TextEditingController transmissionController = TextEditingController();
  Future fuelType(
      {required loginDetails, required url, required context}) async {
    var response = await appRepository.post(
        url: url, context: context, details: loginDetails);
    print("response$response");
    if (response != null) {
      typeFuel = TypeFuel.fromJson(response);
    }
  }

  Future fuelConsume(
      {required loginDetails, required url, required context}) async {
    var response = await appRepository.post(
        url: url, context: context, details: loginDetails);
    print("response$response");
    if (response != null) {
      fuelConsumption = CarFuelConsumption.fromJson(response);
    }
  }

  Future engineSize(
      {required loginDetails, required url, required context}) async {
    var response = await appRepository.post(
        url: url, context: context, details: loginDetails);
    print("response$response");
    if (response != null) {
      carEngineSize = CarEngineSize.fromJson(response);
    }
  }

  Future enginePower(
      {required loginDetails, required url, required context}) async {
    var response = await appRepository.post(
        url: url, context: context, details: loginDetails);
    print("response$response");
    if (response != null) {
      carEnginePower = CarEnginePower.fromJson(response);
    }
  }

  Future color({required loginDetails, required url, required context}) async {
    var response = await appRepository.post(
        url: url, context: context, details: loginDetails);
    print("response$response");
    if (response != null) {
      carColor = CarColor.fromJson(response);
    }
  }

  Future carMileage(
      {required loginDetails, required url, required context}) async {
    var response = await appRepository.post(
        url: url, context: context, details: loginDetails);
    print("response$response");
    if (response != null) {
      mileage = Mileage.fromJson(response);
    }
  }

  Future gearBox(
      {required loginDetails, required url, required context}) async {
    var response = await appRepository.post(
        url: url, context: context, details: loginDetails);
    print("response$response");
    if (response != null) {
      gearbox = CarGearbox.fromJson(response);
    }
  }

  Future door({required loginDetails, required url, required context}) async {
    var response = await appRepository.post(
        url: url, context: context, details: loginDetails);
    print("response$response");
    if (response != null) {
      doors = Doors.fromJson(response);
    }
  }

  Future seat({required loginDetails, required url, required context}) async {
    var response = await appRepository.post(
        url: url, context: context, details: loginDetails);
    print("response$response");
    if (response != null) {
      seats = Seats.fromJson(response);
    }
  }

  Future carTax({required loginDetails, required url, required context}) async {
    var response = await appRepository.post(
        url: url, context: context, details: loginDetails);
    print("response$response");
    if (response != null) {
      tax = Tax.fromJson(response);
    }
  }

  Future carInsurance(
      {required loginDetails, required url, required context}) async {
    var response = await appRepository.post(
        url: url, context: context, details: loginDetails);
    print("response$response");
    if (response != null) {
      insurance = Insurance.fromJson(response);
    }
  }

  selectChoice(Size size, BuildContext context, String title,
      SellCarModel sellCarModel) {
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
                    title == 'Fuel Type'
                        ? typeFuel.fuelType!.length
                        : title == 'Fuel Consumption'
                            ? fuelConsumption.fuelConsumption!.length
                            : title == 'Engine Size'
                                ? carEngineSize.engineSize!.length
                                : title == 'Engine Power'
                                    ? carEnginePower.enginePower!.length
                                    : title == 'Mileage'
                                        ? mileage.carMileage!.length
                                        : title == 'Gearbox'
                                            ? gearbox.gearbox!.length
                                            : title == 'Doors'
                                                ? doors.totalDoors!.length
                                                : title == 'Seats'
                                                    ? seats.totalSeats!.length
                                                    : title == 'Tax'
                                                        ? tax.totalTax!.length
                                                        : title == 'Colour'
                                                            ? carColor
                                                                .color!.length
                                                            : insurance
                                                                .insuranceGroup!
                                                                .length,
                    (index) => InkWell(
                          onTap: () {
                            if (title == 'Fuel Type') {
                              fuelController.text =
                                  typeFuel.fuelType![index].fuelType.toString();
                              sellCarModel.fuelType =
                                  typeFuel.fuelType![index].fuelType.toString();
                            } else if (title == 'Fuel Consumption') {
                              fuelConsumptionController.text = fuelConsumption
                                  .fuelConsumption![index].fuelConsume
                                  .toString();
                              sellCarModel.consumption = fuelConsumption
                                  .fuelConsumption![index].fuelConsume
                                  .toString();
                            } else if (title == 'Engine Size') {
                              engineController.text = carEngineSize
                                  .engineSize![index].engineSize
                                  .toString();
                              sellCarModel.engineSize = carEngineSize
                                  .engineSize![index].engineSize
                                  .toString();
                            } else if (title == 'Engine Power') {
                              powerController.text = carEnginePower
                                  .enginePower![index].enginePower
                                  .toString();
                              sellCarModel.enginePower = carEnginePower
                                  .enginePower![index].enginePower
                                  .toString();
                            } else if (title == 'Mileage') {
                              mileageController.text = mileage
                                  .carMileage![index].carMileage
                                  .toString();
                              sellCarModel.mileage = mileage
                                  .carMileage![index].carMileage
                                  .toString();
                            } else if (title == 'Gearbox') {
                              gearBoxController.text =
                                  gearbox.gearbox![index].gearType.toString();
                              sellCarModel.gearBox =
                                  gearbox.gearbox![index].gearType.toString();
                            } else if (title == 'Doors') {
                              doorsController.text =
                                  doors.totalDoors![index].doors.toString();
                              sellCarModel.doors =
                                  doors.totalDoors![index].doors.toString();
                            } else if (title == "Colour") {
                              colorController.text =
                                  carColor.color![index].name.toString();
                              sellCarModel.colour =
                                  carColor.color![index].name.toString();
                            } else if (title == 'Seats') {
                              seatsController.text = seats
                                  .totalSeats![index].totalSeats
                                  .toString();
                              sellCarModel.seats = seats
                                  .totalSeats![index].totalSeats
                                  .toString();
                            } else if (title == 'Tax') {
                              taxController.text =
                                  tax.totalTax![index].tax.toString();
                              sellCarModel.tax =
                                  tax.totalTax![index].tax.toString();
                            } else {
                              insuranceController.text = insurance
                                  .insuranceGroup![index].insuranceGroup
                                  .toString();
                              sellCarModel.insurance = insurance
                                  .insuranceGroup![index].insuranceGroup
                                  .toString();
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
                                        title == 'Fuel Type'
                                            ? typeFuel.fuelType![index].fuelType
                                                .toString()
                                            : title == 'Fuel Consumption'
                                                ? fuelConsumption
                                                    .fuelConsumption![index]
                                                    .fuelConsume
                                                    .toString()
                                                : title == 'Engine Size'
                                                    ? carEngineSize
                                                        .engineSize![index]
                                                        .engineSize
                                                        .toString()
                                                    : title == 'Engine Power'
                                                        ? carEnginePower
                                                            .enginePower![index]
                                                            .enginePower
                                                            .toString()
                                                        : title == 'Mileage'
                                                            ? mileage
                                                                .carMileage![
                                                                    index]
                                                                .carMileage
                                                                .toString()
                                                            : title == 'Gearbox'
                                                                ? gearbox
                                                                    .gearbox![
                                                                        index]
                                                                    .gearType
                                                                    .toString()
                                                                : title ==
                                                                        'Doors'
                                                                    ? doors
                                                                        .totalDoors![
                                                                            index]
                                                                        .doors
                                                                        .toString()
                                                                    : title ==
                                                                            'Seats'
                                                                        ? seats
                                                                            .totalSeats![index]
                                                                            .totalSeats
                                                                            .toString()
                                                                        : title == 'Tax'
                                                                            ? tax.totalTax![index].tax.toString()
                                                                            : title == 'Colour'
                                                                                ? carColor.color![index].name.toString()
                                                                                : insurance.insuranceGroup![index].insuranceGroup.toString(),
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

  navigateToPhoto(SellCarModel sellCarModel, context) {
    sellCarModel.colour = colorController.text;
    sellCarModel.range = rangeController.text;
    Navigation().push(
      AddPhoto(provider: getIt(), sellCarModel: sellCarModel),
      context,
    );
  }

  navigateToBack(context) {
    Navigation().pop(context);
  }
}
