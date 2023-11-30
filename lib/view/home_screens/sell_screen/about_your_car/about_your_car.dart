import 'package:flutter/material.dart';
import 'package:wizmo/main.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/res/common_widgets/button_widget.dart';
import 'package:wizmo/res/common_widgets/text_field_widget.dart';
import 'package:wizmo/utils/navigator_class.dart';
import 'package:wizmo/view/home_screens/sell_screen/about_your_car/about_your_car_provider.dart';
import 'package:wizmo/view/home_screens/sell_screen/add_photo/add_photo.dart';

class AboutYourCar extends StatefulWidget {
  AboutYourCarProvider provider;
  AboutYourCar({super.key, required this.provider});

  @override
  State<AboutYourCar> createState() => _AboutYourCarState();
}

class _AboutYourCarState extends State<AboutYourCar> {
  AboutYourCarProvider get aboutCarProvider => widget.provider;
  final GlobalKey _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    print('In The About Your Car');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'About your car',
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: AppColors.black),
          ),
          bottom: PreferredSize(
            preferredSize: Size(width * 0.9, height * 0.005),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: width * 0.05,
                ),
                Container(
                  height: height * 0.005,
                  width: width * 0.2,
                  color: AppColors.buttonColor,
                ),
                SizedBox(
                  width: width * 0.01,
                ),
                Container(
                  height: height * 0.005,
                  width: width * 0.2,
                  color: AppColors.buttonColor,
                ),
                SizedBox(
                  width: width * 0.01,
                ),
                Container(
                  height: height * 0.005,
                  width: width * 0.2,
                  color: AppColors.grey,
                ),
              ],
            ),
          )),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.05,
              ),

              ///transmission
              InkWell(
                onTap: () {
                  aboutCarProvider.selectChoice(
                      MediaQuery.of(context).size, context, 'Transmission');
                },
                child: TextFieldWidget(
                  controller: aboutCarProvider.transmissionController,
                  hintText: 'Select transmission',
                  suffixIconColor: AppColors.grey,
                  suffixIcon: Icons.keyboard_arrow_right,
                  enable: false,
                  onChanged: (value) {
                    return null;
                  },
                  onValidate: (value) {
                    if (value.isEmpty) {
                      return "transmission field can't empty";
                    }
                    return null;
                  },
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(height * 0.034),
                      borderSide: BorderSide(color: AppColors.white)),
                ),
              ),
              SizedBox(height: height * 0.025),

              ///FuelType
              InkWell(
                onTap: () {
                  aboutCarProvider.selectChoice(
                      MediaQuery.of(context).size, context, 'Fuel Type');
                },
                child: TextFieldWidget(
                  controller: aboutCarProvider.fuelController,
                  hintText: 'Select fuel type',
                  suffixIconColor: AppColors.grey,
                  suffixIcon: Icons.keyboard_arrow_right,
                  enable: false,
                  onChanged: (value) {
                    return null;
                  },
                  onValidate: (value) {
                    if (value.isEmpty) {
                      return "fuel type field can't empty";
                    }
                    return null;
                  },
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(height * 0.034),
                      borderSide: BorderSide(color: AppColors.white)),
                ),
              ),
              SizedBox(height: height * 0.025),

              ///FuelConsumption
              InkWell(
                onTap: () {
                  aboutCarProvider.selectChoice(
                      MediaQuery.of(context).size, context, 'Fuel Consumption');
                },
                child: TextFieldWidget(
                  controller: aboutCarProvider.fuelConsumptionController,
                  hintText: 'Select fuel consumption',
                  suffixIconColor: AppColors.grey,
                  suffixIcon: Icons.keyboard_arrow_right,
                  enable: false,
                  onChanged: (value) {
                    return null;
                  },
                  onValidate: (value) {
                    if (value.isEmpty) {
                      return "fuel consumption field can't empty";
                    }
                    return null;
                  },
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(height * 0.034),
                      borderSide: BorderSide(color: AppColors.white)),
                ),
              ),
              SizedBox(height: height * 0.025),

              ///engine size
              InkWell(
                onTap: () {
                  aboutCarProvider.selectChoice(
                      MediaQuery.of(context).size, context, 'Engine Size');
                },
                child: TextFieldWidget(
                  controller: aboutCarProvider.engineController,
                  hintText: 'Select engine size',
                  suffixIconColor: AppColors.grey,
                  suffixIcon: Icons.keyboard_arrow_right,
                  enable: false,
                  onChanged: (value) {
                    return null;
                  },
                  onValidate: (value) {
                    if (value.isEmpty) {
                      return "engine size field can't empty";
                    }
                    return null;
                  },
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(height * 0.034),
                      borderSide: BorderSide(color: AppColors.white)),
                ),
              ),
              SizedBox(height: height * 0.025),

              ///Engine power
              InkWell(
                onTap: () {
                  aboutCarProvider.selectChoice(
                      MediaQuery.of(context).size, context, 'Engine Power');
                },
                child: TextFieldWidget(
                  controller: aboutCarProvider.powerController,
                  hintText: 'Select engine power',
                  suffixIconColor: AppColors.grey,
                  suffixIcon: Icons.keyboard_arrow_right,
                  enable: false,
                  onChanged: (value) {
                    return null;
                  },
                  onValidate: (value) {
                    if (value.isEmpty) {
                      return "engine power field can't empty";
                    }
                    return null;
                  },
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(height * 0.034),
                      borderSide: BorderSide(color: AppColors.white)),
                ),
              ),
              SizedBox(height: height * 0.025),

              ///mileage
              InkWell(
                onTap: () {
                  aboutCarProvider.selectChoice(
                      MediaQuery.of(context).size, context, 'Mileage');
                },
                child: TextFieldWidget(
                  controller: aboutCarProvider.mileageController,
                  hintText: 'Select mileage',
                  type: TextInputType.number,
                  suffixIcon: Icons.keyboard_arrow_right,
                  enable: false,
                  onChanged: (value) {
                    return null;
                  },
                  onValidate: (value) {
                    if (value.isEmpty) {
                      return "mileage field can't empty";
                    }
                    return null;
                  },
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(height * 0.034),
                      borderSide: BorderSide(color: AppColors.white)),
                ),
              ),
              SizedBox(
                height: height * 0.025,
              ),

              ///gearbox
              InkWell(
                onTap: () {
                  aboutCarProvider.selectChoice(
                      MediaQuery.of(context).size, context, 'Gearbox');
                },
                child: TextFieldWidget(
                  controller: aboutCarProvider.gearBoxController,
                  hintText: 'Select gearbox',
                  suffixIconColor: AppColors.grey,
                  suffixIcon: Icons.keyboard_arrow_right,
                  enable: false,
                  onChanged: (value) {
                    return null;
                  },
                  onValidate: (value) {
                    if (value.isEmpty) {
                      return "gearbox field can't empty";
                    }
                    return null;
                  },
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(height * 0.034),
                      borderSide: BorderSide(color: AppColors.white)),
                ),
              ),
              SizedBox(height: height * 0.025),

              ///color
              InkWell(
                onTap: () {
                  aboutCarProvider.selectChoice(
                      MediaQuery.of(context).size, context, 'Colour');
                },
                child: TextFieldWidget(
                  controller: aboutCarProvider.colorController,
                  hintText: 'Select colour',
                  suffixIconColor: AppColors.grey,
                  suffixIcon: Icons.keyboard_arrow_right,
                  enable: false,
                  onChanged: (value) {
                    return null;
                  },
                  onValidate: (value) {
                    if (value.isEmpty) {
                      return "colour field can't empty";
                    }
                    return null;
                  },
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(height * 0.034),
                      borderSide: BorderSide(color: AppColors.white)),
                ),
              ),
              SizedBox(height: height * 0.025),

              ///doors
              InkWell(
                onTap: () {
                  aboutCarProvider.selectChoice(
                      MediaQuery.of(context).size, context, 'Doors');
                },
                child: TextFieldWidget(
                  controller: aboutCarProvider.doorsController,
                  hintText: 'Select doors',
                  type: TextInputType.number,
                  suffixIcon: Icons.keyboard_arrow_right,
                  enable: false,
                  onChanged: (value) {
                    return null;
                  },
                  onValidate: (value) {
                    if (value.isEmpty) {
                      return "doors field can't empty";
                    }
                    return null;
                  },
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(height * 0.034),
                      borderSide: BorderSide(color: AppColors.white)),
                ),
              ),
              SizedBox(
                height: height * 0.025,
              ),

              ///seats
              InkWell(
                onTap: () {
                  aboutCarProvider.selectChoice(
                      MediaQuery.of(context).size, context, 'Seats');
                },
                child: TextFieldWidget(
                  controller: aboutCarProvider.seatsController,
                  hintText: 'Select seats',
                  type: TextInputType.number,
                  suffixIcon: Icons.keyboard_arrow_right,
                  enable: false,
                  onChanged: (value) {
                    return null;
                  },
                  onValidate: (value) {
                    if (value.isEmpty) {
                      return "seats field can't empty";
                    }
                    return null;
                  },
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(height * 0.034),
                      borderSide: BorderSide(color: AppColors.white)),
                ),
              ),
              SizedBox(
                height: height * 0.025,
              ),

              ButtonWidget(
                  text: 'Continue',
                  onTap: () {
                    navigateToPhoto();
                  }),
              SizedBox(
                height: height * 0.012,
              ),
              ButtonWidget(
                  text: 'Back',
                  onTap: () {
                    navigateToBack();
                  }),
              SizedBox(
                height: height * 0.015,
              )
            ],
          ),
        ),
      ),
    );
  }

  navigateToBack() {
    Navigation().pop(context);
  }

  navigateToPhoto() {
    Navigation().push(AddPhoto(provider: getIt()), context);
  }
}
