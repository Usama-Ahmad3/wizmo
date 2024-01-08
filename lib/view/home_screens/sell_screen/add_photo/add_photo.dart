import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wizmo/models/sell_car_model.dart';
import 'package:wizmo/res/app_urls/app_urls.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/res/common_widgets/button_widget.dart';
import 'package:wizmo/view/home_screens/sell_screen/add_photo/add_photo_provider.dart';
import 'package:wizmo/view/home_screens/sell_screen/app_bar_widget.dart';

class AddPhoto extends StatefulWidget {
  AddPhotoProvider provider;
  SellCarModel sellCarModel;
  AddPhoto({super.key, required this.provider, required this.sellCarModel});

  @override
  State<AddPhoto> createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  AddPhotoProvider get photoProvider => widget.provider;
  @override
  void initState() {
    print('In The Add Photo');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final getProfile = Provider.of<AddPhotoProvider>(context, listen: false);
    getProfile.getProfile(
        details: null,
        context: context,
        url: '${AppUrls.baseUrl}${AppUrls.profile}');
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(width, height * 0.08),
        child: AppBarWidget(
          title: 'Add photo',
          size: MediaQuery.sizeOf(context),
          color1: AppColors.buttonColor,
          color2: AppColors.buttonColor,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Consumer<AddPhotoProvider>(builder: (context, value, child) {
                return Stack(
                  children: [
                    SizedBox(
                      height: height * 0.83,
                      width: width,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              children: [
                                ...List.generate(
                                    value.image!.isNotEmpty
                                        ? value.image!.length + 1
                                        : 1,
                                    (index) => index == 0
                                        ? Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: width * 0.01),
                                            child: Stack(
                                              children: [
                                                SizedBox(
                                                  height: height * 0.17,
                                                  width: width * 0.43,
                                                ),
                                                Positioned(
                                                  top: height * 0.015,
                                                  left: 0,
                                                  child: Container(
                                                      height: height * 0.15,
                                                      width: width * 0.41,
                                                      decoration: BoxDecoration(
                                                          color: AppColors
                                                              .buttonColor,
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: AppColors
                                                                    .shadowColor
                                                                    .withOpacity(
                                                                        0.17),
                                                                blurStyle:
                                                                    BlurStyle
                                                                        .normal,
                                                                offset:
                                                                    const Offset(
                                                                        1, 1),
                                                                blurRadius: 12,
                                                                spreadRadius: 2)
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      height *
                                                                          0.015)),
                                                      child: IconButton(
                                                        onPressed: () {
                                                          value.imagePicker(
                                                              context: context,
                                                              provider: value);
                                                        },
                                                        icon: Icon(
                                                          Icons
                                                              .camera_alt_rounded,
                                                          size: height * 0.08,
                                                          color:
                                                              AppColors.white,
                                                        ),
                                                      )),
                                                ),
                                              ],
                                            ),
                                          )
                                        : Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: width * 0.01),
                                            child: Stack(
                                              children: [
                                                SizedBox(
                                                  height: height * 0.17,
                                                  width: width * 0.41,
                                                ),
                                                Positioned(
                                                  top: height * 0.015,
                                                  left: 0,
                                                  child: Container(
                                                      height: height * 0.15,
                                                      width: width * 0.38,
                                                      decoration: BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: AppColors
                                                                    .shadowColor
                                                                    .withOpacity(
                                                                        0.17),
                                                                blurStyle:
                                                                    BlurStyle
                                                                        .normal,
                                                                offset:
                                                                    const Offset(
                                                                        1, 1),
                                                                blurRadius: 12,
                                                                spreadRadius: 2)
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      height *
                                                                          0.015)),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    height *
                                                                        0.015),
                                                        child: Image.file(
                                                            value
                                                                .image![
                                                                    index - 1]
                                                                .absolute,
                                                            fit: BoxFit.fill),
                                                      )),
                                                ),
                                                Positioned(
                                                  right: 0,
                                                  top: 0,
                                                  child: InkWell(
                                                    onTap: () {
                                                      context
                                                          .read<
                                                              AddPhotoProvider>()
                                                          .removeImage(
                                                              index - 1);
                                                    },
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          AppColors.white,
                                                      radius: height * 0.02,
                                                      child: Icon(
                                                        FontAwesomeIcons.close,
                                                        color: AppColors.red,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Consumer<AddPhotoProvider>(
                        builder: (context, value, child) {
                      return Positioned(
                          bottom: height * 0.093,
                          left: width * 0.075,
                          child: ButtonWidget(
                              text: 'Continue',
                              onTap: () {
                                Map detail = {
                                  'email':
                                      value.profile.userProfile![0].email ?? '',
                                  'car_name': widget.sellCarModel.carName,
                                  'price': widget.sellCarModel.price,
                                  'insurance': widget.sellCarModel.insurance,
                                  'co2': widget.sellCarModel.co2,
                                  'make': widget.sellCarModel.make,
                                  'model': widget.sellCarModel.model,
                                  'model_variation':
                                      widget.sellCarModel.variation,
                                  'year': widget.sellCarModel.year,
                                  'mileage': widget.sellCarModel.mileage,
                                  'body_type': widget.sellCarModel.bodyType,
                                  'fuel_type': widget.sellCarModel.fuelType,
                                  'engine_size': widget.sellCarModel.engineSize,
                                  'engine_power':
                                      widget.sellCarModel.enginePower,
                                  'fuel_consumption':
                                      widget.sellCarModel.consumption,
                                  'acceleration':
                                      widget.sellCarModel.acceleration,
                                  'latitude': widget.sellCarModel.latitude,
                                  'longitude': widget.sellCarModel.longitude,
                                  'gearbox': widget.sellCarModel.gearBox,
                                  'drivetrain': widget.sellCarModel.driveTrain,
                                  'doors': widget.sellCarModel.doors,
                                  'seats': widget.sellCarModel.seats,
                                  'description':
                                      widget.sellCarModel.description,
                                  'seller_type': widget.sellCarModel.sellerType,
                                  'tax': widget.sellCarModel.tax,
                                  'car_images': value.image,
                                  'location': widget.sellCarModel.location,
                                  "color": widget.sellCarModel.colour,
                                  'listFile': true
                                };
                                print(detail);
                                value.addCarForSell(
                                    context: context,
                                    url: '${AppUrls.baseUrl}${AppUrls.seller}',
                                    detail: detail);
                              }));
                    }),
                    Positioned(
                        bottom: height * 0.014,
                        left: width * 0.075,
                        child: ButtonWidget(
                            text: 'Back',
                            onTap: () {
                              pop();
                            })),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  pop() {
    Navigator.pop(context);
  }
}
