import 'package:flutter/material.dart';
import 'package:wizmo/res/colors/app_colors.dart';

class AboutYourCarProvider with ChangeNotifier {
  ///aboutCarDetail
  TextEditingController engineController = TextEditingController();
  TextEditingController fuelController = TextEditingController();
  TextEditingController fuelConsumptionController = TextEditingController();
  TextEditingController powerController = TextEditingController();
  TextEditingController mileageController = TextEditingController();
  TextEditingController gearBoxController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController doorsController = TextEditingController();
  TextEditingController seatsController = TextEditingController();
  TextEditingController transmissionController = TextEditingController();
  List car = [
    'Ye backend se ayegi is liye list names change ho jaye gey',
    'BMI',
    'Audi',
    'Carola',
    'Honda',
    'Suzuki',
    'Mercedes',
    'Motorola',
    'Ferrari',
    'Sedan',
    'Ford',
  ];
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
                    car.length,
                    (index) => InkWell(
                          onTap: () {
                            title == 'Transmission'
                                ? transmissionController.text = car[index]
                                : title == 'Fuel Type'
                                    ? fuelController.text = car[index]
                                    : title == 'Fuel Consumption'
                                        ? fuelConsumptionController.text =
                                            car[index]
                                        : title == 'Engine Size'
                                            ? engineController.text = car[index]
                                            : title == 'Engine Power'
                                                ? powerController.text =
                                                    car[index]
                                                : title == 'Mileage'
                                                    ? mileageController.text =
                                                        car[index]
                                                    : title == 'Gearbox'
                                                        ? gearBoxController
                                                            .text = car[index]
                                                        : title == 'Colour'
                                                            ? colorController
                                                                    .text =
                                                                car[index]
                                                            : title == 'Doors'
                                                                ? doorsController
                                                                        .text =
                                                                    car[index]
                                                                : seatsController
                                                                        .text =
                                                                    car[index];
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
                                        car[index],
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
}
