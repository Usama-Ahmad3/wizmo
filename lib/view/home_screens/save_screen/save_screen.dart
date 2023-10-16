import 'package:flutter/material.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/res/routes/route_name.dart';
import 'package:wizmo/view/home_screens/account_screen/empty.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({super.key});

  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  @override
  void initState() {
    print('In the Save Screen');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Saved',
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: AppColors.black),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Empty(
        login: () {
          navigateToLogin();
        },
        signup: () {
          navigateToSignup();
        },
      ),
    );
  }

  navigateToSignup() {
    Navigator.pushNamed(context, RouteName.signup);
  }

  navigateToLogin() {
    Navigator.pushNamed(context, RouteName.login);
  }
}
