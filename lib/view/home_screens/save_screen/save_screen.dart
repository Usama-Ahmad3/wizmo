import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizmo/main.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/utils/navigator_class.dart';
import 'package:wizmo/view/home_screens/account_screen/empty.dart';
import 'package:wizmo/view/home_screens/home_screen/home_provider.dart';
import 'package:wizmo/view/home_screens/home_screen/widgets.dart';
import 'package:wizmo/view/login_signup/login/login.dart';
import 'package:wizmo/view/login_signup/signup/signup.dart';

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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
                4,
                (index) => Consumer<HomeProvider>(
                      builder: (context, value, child) => CarContainer(
                        image:
                            'https://tse4.mm.bing.net/th?id=OIP.i-Xdb3eu9ihga0frrt1tWQHaEo&pid=Api&P=0&h=220',
                        price: '3.599 \$',
                        name: 'BMW 3 Series 320',
                        model: '2007',
                        onTap: () {
                          value.showOverlay(context, width, height, () {});
                        },
                      ),
                    )),
            // Empty(
            //   login: () {
            //     navigateToLogin();
            //   },
            //   signup: () {
            //     navigateToSignup();
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  navigateToSignup() {
    NavigatorClass().navigatorPush(SignUp(provider: getIt()), context);
  }

  navigateToLogin() {
    NavigatorClass().navigatorPush(LogIn(provider: getIt()), context);
  }
}
