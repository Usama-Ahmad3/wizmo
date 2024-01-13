import 'package:flutter/material.dart';
import 'package:wizmo/res/colors/app_colors.dart';

class ErrorWidgetScreen extends StatelessWidget {
 final String error;
 const ErrorWidgetScreen({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: height,
      width: width,
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.12,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Center(
                child: Container(
                  height: height * 0.5,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.shadowColor.withOpacity(0.17),
                            blurStyle: BlurStyle.normal,
                            offset: const Offset(1, 1),
                            blurRadius: 5,
                            spreadRadius: 1)
                      ],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: width * .4,
                          width: height * .4,
                          child: Image.asset(
                            'assets/images/icon.png',
                          )),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text('Error Catch',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: const Color(0XFF424242),
                                    fontFamily: "Poppins",
                                  )),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                        child: Text(
                          error,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: const Color(0XFF7A7A7A),
                                    fontFamily: "Poppins",
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
