import 'package:flutter/material.dart';
import 'package:wizmo/res/colors/app_colors.dart';

class CarContainer extends StatelessWidget {
  String image;
  String price;
  CarContainer({super.key, required this.image, required this.price});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.01),
      child: Container(
        height: height * 0.2,
        width: width * 0.4,
        decoration: BoxDecoration(
            color: AppColors.containerB12,
            boxShadow: [
              BoxShadow(
                  color: AppColors.shadowColor,
                  blurRadius: 2,
                  blurStyle: BlurStyle.outer,
                  offset: const Offset(0, 0))
            ],
            borderRadius: BorderRadius.circular(height * 0.007)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.15,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(height * 0.007),
                child: Image.network(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.01, vertical: height * 0.01),
              child: Text(
                '\$ $price',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: AppColors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget TextWidget(
  String text,
  BuildContext context,
  double width,
) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: width * 0.02),
    child: Text(
      text,
      style: Theme.of(context)
          .textTheme
          .headline4!
          .copyWith(color: AppColors.black, fontWeight: FontWeight.bold),
    ),
  );
}
