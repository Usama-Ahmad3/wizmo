import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizmo/main.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/utils/navigator_class.dart';
import 'package:wizmo/view/home_screens/home_screen/home_provider.dart';
import 'package:wizmo/view/home_screens/home_screen/home_widgets/car_container.dart';
import 'package:wizmo/view/home_screens/save_screen/save_provider.dart';
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
    return Consumer<SaveProvider>(builder: (context, value, child) {
      return RefreshIndicator(
        displacement: 200,
        onRefresh: () async {
          value.onRefresh();
        },
        child: value.loading
            ? const Center(child: CircularProgressIndicator())
            : Scaffold(
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
                                builder: (context, value, child) =>
                                    CarContainer(
                                  image: image,
                                  price: '3.599 \$',
                                  name: 'BMW 3 Series 320',
                                  model: '2007',
                                  onTap: () {},
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
              ),
      );
    });
  }

  List image = [
    'https://tse1.mm.bing.net/th?id=OIP.xQpJ3XdZ19bbWIGlx4x20AHaE7&pid=Api&rs=1&c=1&qlt=95&w=181&h=120',
    'https://tse1.mm.bing.net/th?id=OIP.KMosWYXn4e6Q9UTEKWvbFwHaEK&pid=Api&rs=1&c=1&qlt=95&w=215&h=120',
    'https://tse1.mm.bing.net/th?id=OIP.UJxK0oNqZiJQrUqiLNy__AHaEK&pid=Api&rs=1&c=1&qlt=95&w=215&h=120',
    'https://tse1.mm.bing.net/th?id=OIP.UCxthHissS16WQb5jc2RGQHaE8&pid=Api&rs=1&c=1&qlt=95&w=147&h=98',
    'https://tse1.mm.bing.net/th?id=OIP.A6x7GTTriQdrKNO4QFi4pgHaEK&pid=Api&rs=1&c=1&qlt=95&w=222&h=124',
    'https://tse2.mm.bing.net/th?id=OIP.UxHug9E96H7jy8bItL-v3wHaEK&pid=Api&P=0&h=220',
    'https://tse3.mm.bing.net/th?id=OIP.waTDNYaeJXfimOooT3-3HQHaED&pid=Api&P=0&h=220'
  ];

  navigateToSignup() {
    Navigation().push(SignUp(provider: getIt()), context);
  }

  navigateToLogin() {
    Navigation().push(LogIn(provider: getIt()), context);
  }
}
