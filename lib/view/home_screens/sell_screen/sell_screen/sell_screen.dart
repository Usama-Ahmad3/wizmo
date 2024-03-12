import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizmo/res/app_urls/app_urls.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/res/common_widgets/button_widget.dart';
import 'package:wizmo/res/common_widgets/text_field_widget.dart';
import 'package:wizmo/view/home_screens/sell_screen/app_bar_widget.dart';
import 'package:wizmo/view/home_screens/sell_screen/sell_screen/sell_screen_provider.dart';

class SellScreen extends StatefulWidget {
  final SellScreenProvider provider;
  const SellScreen({super.key, required this.provider});

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  SellScreenProvider get sellProvider => widget.provider;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    if (kDebugMode) {
      print('In the Sell Screen');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var authProvider = Provider.of<SellScreenProvider>(context, listen: false);
    authProvider.checkAuth(context);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(width, height * 0.08),
          child: AppBarWidget(
            size: MediaQuery.sizeOf(context),
            color1: AppColors.grey,
            color2: AppColors.grey,
            color3: AppColors.grey,
            title: 'Create a new ad',
          ),
        ),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.05,
                  ),

                  ///name
                  Consumer<SellScreenProvider>(
                    builder: (context, provider, child) => TextFieldWidget(
                      controller: provider.nameController,
                      hintText: 'Enter your car name',
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
                  ),
                  SizedBox(height: height * 0.025),

                  ///Make
                  Consumer<SellScreenProvider>(
                    builder: (context, provider, child) => InkWell(
                      onTap: () {
                        provider
                            .getMake(
                                loginDetails: null,
                                url: '${AppUrls.baseUrl}${AppUrls.make}',
                                context: context)
                            .then((val) {
                          provider.selectChoice(
                              MediaQuery.of(context).size, context, 'Make');
                        });
                      },
                      child: TextFieldWidget(
                        controller: provider.makeController,
                        hintText: 'Select Make',
                        suffixIcon: Icons.keyboard_arrow_right,
                        enable: false,
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
                  ),
                  SizedBox(height: height * 0.025),

                  ///model
                  Consumer<SellScreenProvider>(
                    builder: (context, provider, child) => InkWell(
                      onTap: () {
                        provider
                            .getModel(
                                loginDetails: null,
                                url: '${AppUrls.baseUrl}${AppUrls.carModel}',
                                context: context)
                            .then((val) {
                          provider.selectChoice(
                              MediaQuery.of(context).size, context, 'Model');
                        });
                      },
                      child: TextFieldWidget(
                        controller: provider.modelController,
                        hintText: 'Select your car model',
                        suffixIcon: Icons.keyboard_arrow_right,
                        enable: false,
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
                  ),
                  SizedBox(height: height * 0.025),

                  ///modelVariation
                  Consumer<SellScreenProvider>(
                    builder: (context, provider, child) => InkWell(
                      onTap: () {
                        provider
                            .getModelVariation(
                                loginDetails: null,
                                url:
                                    '${AppUrls.baseUrl}${AppUrls.carVariation}',
                                context: context)
                            .then((value) {
                          provider.selectChoice(MediaQuery.of(context).size,
                              context, 'Variation');
                        });
                      },
                      child: TextFieldWidget(
                        controller: provider.modelVariationController,
                        hintText: 'Select your car model variation',
                        suffixIcon: Icons.keyboard_arrow_right,
                        enable: false,
                        onValidate: (value) {
                          if (value.isEmpty) {
                            return "car model variation field can't empty";
                          }
                          return null;
                        },
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(height * 0.034),
                            borderSide: BorderSide(color: AppColors.white)),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.025),

                  ///year
                  Consumer<SellScreenProvider>(
                    builder: (context, provider, child) => InkWell(
                      onTap: () {
                        provider
                            .getYear(
                                loginDetails: null,
                                url: '${AppUrls.baseUrl}${AppUrls.carYear}',
                                context: context)
                            .then((value) {
                          provider.selectChoice(
                              MediaQuery.of(context).size, context, 'Year');
                        });
                      },
                      child: TextFieldWidget(
                        controller: provider.yearController,
                        hintText: 'Select your car year',
                        suffixIcon: Icons.keyboard_arrow_right,
                        enable: false,
                        onValidate: (value) {
                          if (value.isEmpty) {
                            return "car year field can't empty";
                          }
                          return null;
                        },
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(height * 0.034),
                            borderSide: BorderSide(color: AppColors.white)),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.025),

                  ///bodyType
                  Consumer<SellScreenProvider>(
                    builder: (context, provider, child) => InkWell(
                      onTap: () {
                        provider
                            .getBodyType(
                                loginDetails: null,
                                url: '${AppUrls.baseUrl}${AppUrls.carBodyType}',
                                context: context)
                            .then((value) {
                          provider.selectChoice(MediaQuery.of(context).size,
                              context, 'body_type');
                        });
                      },
                      child: TextFieldWidget(
                        controller: provider.bodyTypeController,
                        hintText: 'Select body_type',
                        suffixIcon: Icons.keyboard_arrow_right,
                        enable: false,
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
                  ),
                  SizedBox(height: height * 0.025),

                  ///acceleration
                  Consumer<SellScreenProvider>(
                    builder: (context, provider, child) => InkWell(
                      onTap: () {
                        provider
                            .getAcceleration(
                                loginDetails: null,
                                url:
                                    '${AppUrls.baseUrl}${AppUrls.carAcceleration}',
                                context: context)
                            .then((value) {
                          provider.selectChoice(MediaQuery.of(context).size,
                              context, 'Acceleration');
                        });
                      },
                      child: TextFieldWidget(
                        controller: provider.accelerationController,
                        hintText: 'acceleration',
                        enable: false,
                        suffixIcon: Icons.keyboard_arrow_right,
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
                  ),
                  SizedBox(height: height * 0.025),

                  ///driveTrain
                  Consumer<SellScreenProvider>(
                    builder: (context, provider, child) => InkWell(
                      onTap: () {
                        provider
                            .getDriveTrain(
                                loginDetails: null,
                                url:
                                    '${AppUrls.baseUrl}${AppUrls.carDriveTrain}',
                                context: context)
                            .then((value) {
                          provider.selectChoice(MediaQuery.of(context).size,
                              context, 'Drivetrain');
                        });
                      },
                      child: TextFieldWidget(
                        controller: provider.driveTrainController,
                        hintText: 'Select drivetrain',
                        enable: false,
                        suffixIcon: Icons.keyboard_arrow_right,
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
                  ),
                  SizedBox(height: height * 0.025),

                  ///Co2
                  Consumer<SellScreenProvider>(
                    builder: (context, provider, child) => InkWell(
                      onTap: () {
                        provider
                            .getCo2(
                                loginDetails: null,
                                url: '${AppUrls.baseUrl}${AppUrls.carCO2}',
                                context: context)
                            .then((value) {
                          provider.selectChoice(
                              MediaQuery.of(context).size, context, 'Co2');
                        });
                      },
                      child: TextFieldWidget(
                        controller: provider.co2Controller,
                        hintText: 'Select co2',
                        suffixIcon: Icons.keyboard_arrow_right,
                        enable: false,
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
                  ),
                  SizedBox(height: height * 0.025),

                  ///registration Number
                  Consumer<SellScreenProvider>(
                    builder: (context, provider, child) => TextFieldWidget(
                      controller: provider.registrationController,
                      hintText: 'Enter your registration number',
                      type: TextInputType.number,
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
                  ),
                  SizedBox(height: height * 0.025),

                  ///sellerType

                  Consumer<SellScreenProvider>(
                    builder: (context, provider, child) => InkWell(
                      onTap: () {
                        provider
                            .getSellerType(
                                loginDetails: null,
                                url:
                                    '${AppUrls.baseUrl}${AppUrls.carSellerType}',
                                context: context)
                            .then((value) {
                          provider.selectChoice(
                              MediaQuery.of(context).size, context, 'Seller');
                        });
                      },
                      child: TextFieldWidget(
                        controller: provider.sellerTypeController,
                        hintText: 'Select seller type',
                        suffixIcon: Icons.keyboard_arrow_right,
                        enable: false,
                        onValidate: (value) {
                          if (value.isEmpty) {
                            return "seller type field can't empty";
                          }
                          return null;
                        },
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(height * 0.034),
                            borderSide: BorderSide(color: AppColors.white)),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.025),

                  ///location
                  Consumer<SellScreenProvider>(
                    builder: (context, provider, child) => InkWell(
                      onTap: () {
                        provider.navigateToMap(context);
                      },
                      child: TextFieldWidget(
                        controller: provider.locationController,
                        hintText: 'Select your location',
                        suffixIcon: Icons.keyboard_arrow_right,
                        enable: false,
                        onValidate: (value) {
                          if (value.isEmpty) {
                            return "location field can't empty";
                          }
                          return null;
                        },
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(height * 0.034),
                            borderSide: BorderSide(color: AppColors.white)),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.025),

                  ///price
                  Consumer<SellScreenProvider>(
                    builder: (context, provider, child) => TextFieldWidget(
                      controller: provider.priceController,
                      hintText: 'Enter price',
                      type: TextInputType.number,
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
                  ),
                  SizedBox(height: height * 0.025),

                  ///description
                  Consumer<SellScreenProvider>(
                    builder: (context, provider, child) => InkWell(
                      onTap: () {
                        provider.auto
                            ? provider.autoDescriptionDialog(context, height)
                            : null;
                      },
                      child: TextFieldMultiWidget(
                        controller: provider.descriptionController,
                        hintText: 'Enter description',
                        enable: provider.manual,
                        suffixIcon: Icons.keyboard_arrow_right,
                        suffixIconColor: AppColors.grey,
                        hideIcon: Icons.keyboard_arrow_right,
                        passTap: () {
                          provider.autoDescriptionDialog(context, height);
                        },
                        onValidate: (value) {
                          if (provider.auto) {
                            return null;
                          } else {
                            if (value.isEmpty) {
                              return "description field can't empty";
                            }
                            return null;
                          }
                        },
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(height * 0.034),
                            borderSide: BorderSide(color: AppColors.white)),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                  Consumer<SellScreenProvider>(
                    builder: (context, provider, child) => ButtonWidget(
                        text: 'Continue',
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            provider.navigateToAboutCar(context);
                          }
                        }),
                  ),
                  SizedBox(
                    height: height * 0.034,
                  )
                ],
              ),
            )));
  }
}
