import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/res/common_widgets/button_widget.dart';
import 'package:wizmo/view/home_screens/sell_screen/add_photo/add_photo_provider.dart';
import 'package:wizmo/view/home_screens/sell_screen/sell_screen/sell_screen_provider.dart';

class AddPhoto extends StatefulWidget {
  AddPhotoProvider provider;
  AddPhoto({super.key, required this.provider});

  @override
  State<AddPhoto> createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  AddPhotoProvider get photoProvider => widget.provider;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Add photo',
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
                  color: AppColors.buttonColor,
                ),
              ],
            ),
          )),
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
                                                  height: height * 0.18,
                                                  width: width * 0.43,
                                                ),
                                                Positioned(
                                                  top: height * 0.01,
                                                  left: 0,
                                                  child: Container(
                                                      height: height * 0.16,
                                                      width: width * 0.41,
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
                                                        child: Image.file(value
                                                            .image![index - 1]
                                                            .absolute),
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
                    Positioned(
                        bottom: height * 0.093,
                        left: width * 0.075,
                        child: ButtonWidget(text: 'Continue', onTap: () {})),
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
