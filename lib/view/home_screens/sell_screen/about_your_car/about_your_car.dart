import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizmo/models/sell_car_model.dart';
import 'package:wizmo/res/app_urls/app_urls.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/res/common_widgets/button_widget.dart';
import 'package:wizmo/res/common_widgets/text_field_widget.dart';
import 'package:wizmo/view/home_screens/sell_screen/about_your_car/about_your_car_provider.dart';

class AboutYourCar extends StatefulWidget {
  AboutYourCarProvider provider;
  SellCarModel sellCarModel;
  AboutYourCar({super.key, required this.provider, required this.sellCarModel});

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
          child: Consumer<AboutYourCarProvider>(
            builder: (context, provider, child) => Column(
              children: [
                SizedBox(
                  height: height * 0.05,
                ),

                // ///transmission
                // InkWell(
                //   onTap: () {
                //     aboutCarProvider.selectChoice(MediaQuery.of(context).size,
                //         context, 'Transmission', widget.sellCarModel);
                //   },
                //   child: TextFieldWidget(
                //     controller: aboutCarProvider.transmissionController,
                //     hintText: 'Select transmission',
                //     suffixIconColor: AppColors.grey,
                //     suffixIcon: Icons.keyboard_arrow_right,
                //     enable: false,
                //     onChanged: (value) {
                //       return null;
                //     },
                //     onValidate: (value) {
                //       if (value.isEmpty) {
                //         return "transmission field can't empty";
                //       }
                //       return null;
                //     },
                //     border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(height * 0.034),
                //         borderSide: BorderSide(color: AppColors.white)),
                //   ),
                // ),
                // SizedBox(height: height * 0.025),

                ///FuelType
                InkWell(
                  onTap: () {
                    provider
                        .fuelType(
                            loginDetails: null,
                            url: '${AppUrls.baseUrl}${AppUrls.fuelType}',
                            context: context)
                        .then((value) {
                      provider.selectChoice(MediaQuery.of(context).size,
                          context, 'Fuel Type', widget.sellCarModel);
                    });
                  },
                  child: TextFieldWidget(
                    controller: provider.fuelController,
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
                    provider
                        .fuelConsume(
                            loginDetails: null,
                            url: "${AppUrls.baseUrl}${AppUrls.fuelConsumption}",
                            context: context)
                        .then((value) {
                      provider.selectChoice(MediaQuery.of(context).size,
                          context, 'Fuel Consumption', widget.sellCarModel);
                    });
                  },
                  child: TextFieldWidget(
                    controller: provider.fuelConsumptionController,
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
                    provider
                        .engineSize(
                            loginDetails: null,
                            url: '${AppUrls.baseUrl}${AppUrls.engineSize}',
                            context: context)
                        .then((value) {
                      provider.selectChoice(MediaQuery.of(context).size,
                          context, 'Engine Size', widget.sellCarModel);
                    });
                  },
                  child: TextFieldWidget(
                    controller: provider.engineController,
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
                    provider
                        .enginePower(
                            loginDetails: null,
                            url: '${AppUrls.baseUrl}${AppUrls.enginePower}',
                            context: context)
                        .then((value) {
                      provider.selectChoice(MediaQuery.of(context).size,
                          context, 'Engine Power', widget.sellCarModel);
                    });
                  },
                  child: TextFieldWidget(
                    controller: provider.powerController,
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
                    provider
                        .carMileage(
                            loginDetails: null,
                            url: '${AppUrls.baseUrl}${AppUrls.mileage}',
                            context: context)
                        .then((value) {
                      provider.selectChoice(MediaQuery.of(context).size,
                          context, 'Mileage', widget.sellCarModel);
                    });
                  },
                  child: TextFieldWidget(
                    controller: provider.mileageController,
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
                    provider
                        .gearBox(
                            loginDetails: null,
                            url: '${AppUrls.baseUrl}${AppUrls.gearbox}',
                            context: context)
                        .then((value) {
                      provider.selectChoice(MediaQuery.of(context).size,
                          context, 'Gearbox', widget.sellCarModel);
                    });
                  },
                  child: TextFieldWidget(
                    controller: provider.gearBoxController,
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
                    aboutCarProvider.selectChoice(MediaQuery.of(context).size,
                        context, 'Colour', widget.sellCarModel);
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
                    provider
                        .door(
                            loginDetails: null,
                            url: '${AppUrls.baseUrl}${AppUrls.doors}',
                            context: context)
                        .then((value) {
                      provider.selectChoice(MediaQuery.of(context).size,
                          context, 'Doors', widget.sellCarModel);
                    });
                  },
                  child: TextFieldWidget(
                    controller: provider.doorsController,
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
                    provider
                        .seat(
                            loginDetails: null,
                            url: '${AppUrls.baseUrl}${AppUrls.seats}',
                            context: context)
                        .then((value) {
                      provider.selectChoice(MediaQuery.of(context).size,
                          context, 'Seats', widget.sellCarModel);
                    });
                  },
                  child: TextFieldWidget(
                    controller: provider.seatsController,
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

                ///tax
                InkWell(
                  onTap: () {
                    provider
                        .carTax(
                            loginDetails: null,
                            url: '${AppUrls.baseUrl}${AppUrls.tax}',
                            context: context)
                        .then((value) {
                      provider.selectChoice(MediaQuery.of(context).size,
                          context, 'Tax', widget.sellCarModel);
                    });
                  },
                  child: TextFieldWidget(
                    controller: provider.taxController,
                    hintText: 'Select tax',
                    type: TextInputType.number,
                    suffixIcon: Icons.keyboard_arrow_right,
                    enable: false,
                    onChanged: (value) {
                      return null;
                    },
                    onValidate: (value) {
                      if (value.isEmpty) {
                        return "tax field can't empty";
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

                ///insurance
                InkWell(
                  onTap: () {
                    provider
                        .carInsurance(
                            loginDetails: null,
                            url: '${AppUrls.baseUrl}${AppUrls.insurance}',
                            context: context)
                        .then((value) {
                      provider.selectChoice(MediaQuery.of(context).size,
                          context, 'Insurance', widget.sellCarModel);
                    });
                  },
                  child: TextFieldWidget(
                    controller: provider.insuranceController,
                    hintText: 'Select insurance',
                    type: TextInputType.number,
                    suffixIcon: Icons.keyboard_arrow_right,
                    enable: false,
                    onChanged: (value) {
                      return null;
                    },
                    onValidate: (value) {
                      if (value.isEmpty) {
                        return "insurance field can't empty";
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
                      provider.navigateToPhoto(widget.sellCarModel, context);
                    }),
                SizedBox(
                  height: height * 0.012,
                ),
                ButtonWidget(
                    text: 'Back',
                    onTap: () {
                      provider.navigateToBack(context);
                    }),
                SizedBox(
                  height: height * 0.015,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
