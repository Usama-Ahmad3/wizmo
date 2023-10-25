import 'package:flutter/material.dart';
import 'package:wizmo/res/colors/app_colors.dart';

Widget modelList(width, height, modelName, text, number, context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: width * 0.03),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: height * 0.01),
          child: Container(
            height: height * 0.07,
            decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.shadowColor.withOpacity(0.17),
                      blurStyle: BlurStyle.normal,
                      offset: const Offset(1, 1),
                      blurRadius: 12,
                      spreadRadius: 2)
                ],
                borderRadius: BorderRadius.circular(height * 0.01)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.06),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    modelName,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    number,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget searchText(String text, double width, BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: width * 0.03),
    child: Align(
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline2,
      ),
    ),
  );
}
