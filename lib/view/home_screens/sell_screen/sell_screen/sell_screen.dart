import 'package:flutter/material.dart';
import 'package:wizmo/main.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/res/common_widgets/button_widget.dart';
import 'package:wizmo/res/common_widgets/text_field_widget.dart';
import 'package:wizmo/utils/navigator_class.dart';
import 'package:wizmo/view/home_screens/sell_screen/about_your_car/about_your_car.dart';
import 'package:wizmo/view/home_screens/sell_screen/sell_screen/sell_screen_provider.dart';

class SellScreen extends StatefulWidget {
  SellScreenProvider provider;
  SellScreen({super.key, required this.provider});

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  SellScreenProvider get sellProvider => widget.provider;
  final GlobalKey _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    print('In the Sell Screen');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Create a new ad',
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
                  color: AppColors.grey,
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

              ///name
              TextFieldWidget(
                controller: sellProvider.nameController,
                hintText: 'Enter your name',
                onTap: () {},
                onChanged: (value) {
                  return null;
                },
                onValidate: (value) {
                  if (value.isEmpty) {
                    return "name field can't empty";
                  }
                  return null;
                },
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(height * 0.034),
                    borderSide: BorderSide(color: AppColors.white)),
              ),
              SizedBox(height: height * 0.025),

              ///Make
              InkWell(
                onTap: () {
                  sellProvider.selectChoice(
                      MediaQuery.of(context).size, context, 'Make');
                },
                child: TextFieldWidget(
                  controller: sellProvider.makeController,
                  hintText: 'Select Make',
                  suffixIcon: Icons.keyboard_arrow_right,
                  enable: false,
                  onChanged: (value) {
                    return null;
                  },
                  onValidate: (value) {
                    if (value.isEmpty) {
                      return "make field can't empty";
                    }
                    return null;
                  },
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(height * 0.034),
                      borderSide: BorderSide(
                        color: AppColors.white,
                      )),
                ),
              ),
              SizedBox(height: height * 0.025),

              ///model
              InkWell(
                onTap: () {
                  sellProvider.selectChoice(
                      MediaQuery.of(context).size, context, 'Model');
                },
                child: TextFieldWidget(
                  controller: sellProvider.modelController,
                  hintText: 'Select your car model',
                  suffixIcon: Icons.keyboard_arrow_right,
                  enable: false,
                  onChanged: (value) {
                    return null;
                  },
                  onValidate: (value) {
                    if (value.isEmpty) {
                      return "car model field can't empty";
                    }
                    return null;
                  },
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(height * 0.034),
                      borderSide: BorderSide(color: AppColors.white)),
                ),
              ),
              SizedBox(height: height * 0.025),

              ///bodyType
              InkWell(
                onTap: () {
                  sellProvider.selectChoice(
                      MediaQuery.of(context).size, context, 'body_type');
                },
                child: TextFieldWidget(
                  controller: sellProvider.bodyTypeController,
                  hintText: 'Select body_type',
                  suffixIcon: Icons.keyboard_arrow_right,
                  enable: false,
                  onChanged: (value) {
                    return null;
                  },
                  onValidate: (value) {
                    if (value.isEmpty) {
                      return "body_type field can't empty";
                    }
                    return null;
                  },
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(height * 0.034),
                      borderSide: BorderSide(color: AppColors.white)),
                ),
              ),
              SizedBox(height: height * 0.025),

              ///acceleration
              InkWell(
                onTap: () {
                  sellProvider.selectChoice(
                      MediaQuery.of(context).size, context, 'Acceleration');
                },
                child: TextFieldWidget(
                  controller: sellProvider.accelerationController,
                  hintText: 'acceleration',
                  enable: false,
                  suffixIcon: Icons.keyboard_arrow_right,
                  onChanged: (value) {
                    return null;
                  },
                  onValidate: (value) {
                    if (value.isEmpty) {
                      return "acceleration field can't empty";
                    }
                    return null;
                  },
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(height * 0.034),
                      borderSide: BorderSide(color: AppColors.white)),
                ),
              ),
              SizedBox(height: height * 0.025),

              ///driveTrain
              InkWell(
                onTap: () {
                  sellProvider.selectChoice(
                      MediaQuery.of(context).size, context, 'Drivetrain');
                },
                child: TextFieldWidget(
                  controller: sellProvider.driveTrainController,
                  hintText: 'Select drivetrain',
                  enable: false,
                  suffixIcon: Icons.keyboard_arrow_right,
                  onChanged: (value) {
                    return null;
                  },
                  onValidate: (value) {
                    if (value.isEmpty) {
                      return "drivetrain field can't empty";
                    }
                    return null;
                  },
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(height * 0.034),
                      borderSide: BorderSide(color: AppColors.white)),
                ),
              ),
              SizedBox(height: height * 0.025),

              ///Co2
              InkWell(
                onTap: () {
                  sellProvider.selectChoice(
                      MediaQuery.of(context).size, context, 'Co2');
                },
                child: TextFieldWidget(
                  controller: sellProvider.co2Controller,
                  hintText: 'Select co2',
                  suffixIcon: Icons.keyboard_arrow_right,
                  enable: false,
                  onChanged: (value) {
                    return null;
                  },
                  onValidate: (value) {
                    if (value.isEmpty) {
                      return "co2 field can't empty";
                    }
                    return null;
                  },
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(height * 0.034),
                      borderSide: BorderSide(color: AppColors.white)),
                ),
              ),
              SizedBox(height: height * 0.025),

              ///registration Number
              TextFieldWidget(
                controller: sellProvider.registrationController,
                hintText: 'Enter Registration Number',
                onTap: () {},
                onChanged: (value) {
                  return null;
                },
                onValidate: (value) {
                  if (value.isEmpty) {
                    return "Registration field can't empty";
                  }
                  return null;
                },
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(height * 0.034),
                    borderSide: BorderSide(color: AppColors.white)),
              ),
              SizedBox(height: height * 0.025),

              ///price
              TextFieldWidget(
                controller: sellProvider.priceController,
                hintText: 'Enter price',
                type: TextInputType.number,
                onTap: () {},
                onChanged: (value) {
                  return null;
                },
                onValidate: (value) {
                  if (value.isEmpty) {
                    return "price field can't empty";
                  }
                  return null;
                },
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(height * 0.034),
                    borderSide: BorderSide(color: AppColors.white)),
              ),
              SizedBox(height: height * 0.025),

              ///description
              TextFieldMultiWidget(
                controller: sellProvider.descriptionController,
                hintText: 'Enter description',
                onTap: () {},
                onChanged: (value) {
                  return null;
                },
                onValidate: (value) {
                  if (value.isEmpty) {
                    return "description field can't empty";
                  }
                  return null;
                },
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(height * 0.034),
                    borderSide: BorderSide(color: AppColors.white)),
              ),
              SizedBox(height: height * 0.04),
              ButtonWidget(
                  text: 'Continue',
                  onTap: () {
                    navigateToAboutCar();
                  }),
              SizedBox(
                height: height * 0.034,
              )
            ],
          ),
        ),
      ),
    );
  }

  navigateToAboutCar() {
    Navigation().push(AboutYourCar(provider: getIt()), context);
  }
}
