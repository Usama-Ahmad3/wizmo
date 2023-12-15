import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wizmo/main.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/res/common_widgets/button_widget.dart';
import 'package:wizmo/utils/navigator_class.dart';
import 'package:wizmo/view/home_screens/main_bottom_bar/main_bottom_bar.dart';

class CongratsScreen extends StatelessWidget {
  const CongratsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.2,
            ),
            Lottie.asset('assets/lotie_files/congrats.json',
                height: height * 0.3, width: width),
            SizedBox(
              height: height * 0.01,
            ),
            Center(
              child: Text(
                "Congratulations!",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Center(
              child: Text(
                "Your ad has been successfully added!",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: AppColors.buttonColor),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Center(
                child: Text(
                  "You can see your ad in your account.All you have to do now is wait for the future owner of your car.",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            ButtonWidget(
                text: 'Continue',
                onTap: () {
                  navigateToHomeScreen(context);
                })
          ],
        ),
      ),
    );
  }

  navigateToHomeScreen(context) {
    Navigation().pushRep(MainBottomBar(provider: getIt(), index: 0), context);
  }
}
