import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wizmo/models/sell_car_model.dart';
import 'package:wizmo/res/app_urls/app_urls.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/res/common_widgets/button_widget.dart';
import 'package:wizmo/utils/flushbar.dart';
import 'package:wizmo/view/home_screens/sell_screen/add_photo/add_photo_provider.dart';
import 'package:wizmo/view/home_screens/sell_screen/app_bar_widget.dart';

class AddPhoto extends StatefulWidget {
 final AddPhotoProvider provider;
 final SellCarModel sellCarModel;
 const AddPhoto({super.key, required this.provider, required this.sellCarModel});

  @override
  State<AddPhoto> createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  AddPhotoProvider get photoProvider => widget.provider;
  @override
  void initState() {
    if(kDebugMode){
    print('In The Add Photo');
    }
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
                                if (value.image != null) {
                                  Map detail = {
                                    'email':
                                        value.profile.userProfile![0].email ??
                                            '',
                                    'car_name': widget.sellCarModel.carName,
                                    'price': widget.sellCarModel.price,
                                    'insurance': widget.sellCarModel.insurance,
                                    'co': widget.sellCarModel.co2,
                                    'make': widget.sellCarModel.make,
                                    'model': widget.sellCarModel.model,
                                    'modelvariation':
                                        widget.sellCarModel.variation,
                                    'year': widget.sellCarModel.year,
                                    'mileage': widget.sellCarModel.mileage,
                                    'bodytype': widget.sellCarModel.bodyType,
                                    'fuletype': widget.sellCarModel.fuelType,
                                    'enginesize':
                                        widget.sellCarModel.engineSize,
                                    'enginepower':
                                        widget.sellCarModel.enginePower,
                                    'fuelconsumption':
                                        widget.sellCarModel.consumption,
                                    'acceleration':
                                        widget.sellCarModel.acceleration,
                                    'latitude': widget.sellCarModel.latitude,
                                    'longitude': widget.sellCarModel.longitude,
                                    'gearboxe': widget.sellCarModel.gearBox,
                                    'drivetrain':
                                        widget.sellCarModel.driveTrain,
                                    'door': widget.sellCarModel.doors,
                                    'seat': widget.sellCarModel.seats,
                                    'description':
                                        widget.sellCarModel.description,
                                    'sellertype':
                                        widget.sellCarModel.sellerType,
                                    'tax': widget.sellCarModel.tax,
                                    'car_images': value.image,
                                    'location': widget.sellCarModel.location,
                                    "color": widget.sellCarModel.colour,
                                    'listFile': true
                                  };
                                  if(kDebugMode){
                                  print(detail);
                                  }
                                  value.addCarForSell(
                                      context: context,
                                      url:
                                          '${AppUrls.baseUrl}${AppUrls.seller}',
                                      detail: detail);
                                } else {
                                  FlushBarUtils.flushBar('Images are not added',
                                      context, 'Information');
                                }
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
