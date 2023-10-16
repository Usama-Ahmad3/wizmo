import 'package:flutter/material.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/view/home_screens/home_screen/home_provider.dart';
import 'package:wizmo/view/home_screens/home_screen/widgets.dart';

import 'home_initial_params.dart';

class HomePage extends StatefulWidget {
  HomeInitialParams initialParams;
  HomePage({super.key, required this.initialParams});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeProvider get homeProvider => widget.initialParams.provider;
  @override
  void initState() {
    print('In The Home Screen');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.initialParams.name),
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(child: Image.asset('assets/images/wizmo.jpg')),
            SizedBox(
              height: height * 0.035,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              child: Container(
                height: height * 0.35,
                width: width,
                decoration: BoxDecoration(
                    color: AppColors.containerB12,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.shadowColor,
                          blurRadius: 2,
                          blurStyle: BlurStyle.outer,
                          offset: const Offset(0, 0))
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.03, vertical: height * 0.01),
                      child: Text(
                        'Find your perfect car',
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(color: AppColors.black),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.035, vertical: height * 0.01),
                      child: Container(
                        height: height * 0.06,
                        width: width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Text(
                            'Select Make',
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(color: AppColors.black),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.035, vertical: height * 0.01),
                      child: Container(
                        height: height * 0.06,
                        width: width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Text(
                            'Select Model',
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(color: AppColors.black),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              homeProvider.flushBarUtils(
                                  'Checking', context, 'Test');
                            },
                            child: const Row(
                              children: [Icon(Icons.refresh), Text('Refresh')],
                            ),
                          ),
                          const Text('More options')
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                      child: Container(
                        height: height * 0.063,
                        width: width,
                        decoration: BoxDecoration(
                            color: AppColors.blue,
                            borderRadius: BorderRadius.circular(height * 0.02)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.search,
                                color: AppColors.white,
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              Text(
                                'Search 476,476 cars',
                                style: Theme.of(context).textTheme.headline4,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            TextWidget('Recently Viewed', context, width),
            SizedBox(
              height: height * 0.02,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    5,
                    (index) =>
                        CarContainer(image: image[index], price: '3847.78'),
                  )
                ],
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget('SUZUKI SX4 Crossover', context, width),
                Icon(
                  Icons.arrow_forward,
                  color: AppColors.blue,
                )
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    5,
                    (index) =>
                        CarContainer(image: image[index + 2], price: '3847.78'),
                  )
                ],
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
          ],
        ),
      ),
    );
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
}
