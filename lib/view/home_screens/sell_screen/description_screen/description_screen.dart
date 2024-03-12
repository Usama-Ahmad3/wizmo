import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizmo/models/sell_car_model.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/res/common_widgets/button_widget.dart';
import 'package:wizmo/res/common_widgets/text_field_widget.dart';
import 'package:wizmo/view/home_screens/sell_screen/app_bar_widget.dart';

import 'description_screen_provider.dart';

class DescriptionScreen extends StatefulWidget {
  final SellCarModel sellCarModel;
  const DescriptionScreen({super.key, required this.sellCarModel});

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    final description =
        Provider.of<DescriptionScreenProvider>(context, listen: false);
    description.autoDescription(sellCarModel: widget.sellCarModel);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(width, height * 0.08),
        child: AppBarWidget(
          title: 'Edit Description',
          color1: AppColors.buttonColor,
          color2: AppColors.buttonColor,
          color3: AppColors.grey,
          size: MediaQuery.sizeOf(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          // TextWidget('Description', context, width),
          // SizedBox(
          //   height: height * 0.02,
          // ),
          Consumer<DescriptionScreenProvider>(builder: (context, value, child) {
            return TextFieldMultiWidget(
                controller: value.descriptionController,
                hintText: '',
                maxLine: 23,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(height * 0.034),
                    borderSide: BorderSide(color: AppColors.white)));
          }),
          SizedBox(
            height: height * 0.05,
          ),
          Consumer<DescriptionScreenProvider>(
            builder: (context, provider, child) => Center(
              child: ButtonWidget(
                  text: 'Continue',
                  onTap: () {
                    provider.navigateToAddPhoto(
                        sellCarModel: widget.sellCarModel, context: context);
                  }),
            ),
          ),
          SizedBox(
            height: height * 0.012,
          ),
          Consumer<DescriptionScreenProvider>(
            builder: (context, provider, child) => Center(
              child: ButtonWidget(
                  text: 'Back',
                  onTap: () {
                    provider.navigateToBack(context: context);
                  }),
            ),
          ),
          SizedBox(
            height: height * 0.015,
          )
        ],
      ),
    );
  }
}
