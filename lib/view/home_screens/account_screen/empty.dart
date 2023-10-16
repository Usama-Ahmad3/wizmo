import 'package:flutter/material.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/res/common_widgets/button_widget.dart';

class Empty extends StatelessWidget {
  VoidCallback login;
  VoidCallback signup;
  Empty({super.key, required this.login, required this.signup});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: height * 0.1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            height: height * .58,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: AppColors.shadowColor.withOpacity(0.17),
                  blurStyle: BlurStyle.normal,
                  offset: const Offset(1, 1),
                  blurRadius: 12,
                  spreadRadius: 2)
            ], color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.02, vertical: height * 0.013),
                  child: Center(
                      child: Text(
                    'please login to your account or signup to create a new account',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4,
                  )),
                ),
                SizedBox(
                  height: height * 0.023,
                ),
                Image.asset(
                  'assets/images/Group.png',
                  height: height * 0.3,
                ),
                SizedBox(
                  height: height * 0.035,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                  child: ButtonWidget(
                    onTap: login,
                    text: 'Login',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.065, vertical: height * 0.025),
                  child: GestureDetector(
                    onTap: signup,
                    child: Row(
                      children: [
                        Text(
                          "Don't have an account? ",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        Text(
                          'signUp',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(color: AppColors.red),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
