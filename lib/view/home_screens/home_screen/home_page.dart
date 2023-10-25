import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizmo/main.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/res/common_widgets/text_field_widget.dart';
import 'package:wizmo/utils/navigator_class.dart';
import 'package:wizmo/view/home_screens/home_screen/home_provider.dart';
import 'package:wizmo/view/home_screens/home_screen/widgets.dart';
import 'package:wizmo/view/home_screens/main_bottom_bar/main_bottom_bar.dart';

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
            Consumer<HomeProvider>(builder: (context, value, child) {
              return Row(
                children: [
                  SizedBox(
                    width: width * 0.85,
                    height: height * 0.065,
                    child: TextFieldWidget(
                      controller: homeProvider.searchController,
                      hintText: 'Search',
                      suffixIcon: Icons.search,
                      onTap: () {},
                      onChanged: (value) {
                        return null;
                      },
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(height * 0.034),
                          borderSide: BorderSide(color: AppColors.white)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (value.overlayEntry == null) {
                        context
                            .read<HomeProvider>()
                            .showOverlay(context, width, height, () {
                          navigateToSearch(1);
                          value.overlayRemove();
                        });
                      } else {
                        context.read<HomeProvider>().overlayRemove();
                      }
                    },
                    child: Container(
                      width: width * 0.13,
                      height: height * 0.075,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.buttonColor),
                      child: Icon(
                        Icons.filter_list_alt,
                        color: AppColors.white,
                      ),
                    ),
                  )
                ],
              );
            }),
            SizedBox(
              height: height * 0.01,
            ),
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
            SizedBox(
              height: height * 0.025,
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
  navigateToSearch(index) {
    NavigatorClass().navigatorPushReplacment(
        MainBottomBar(
          index: index,
          provider: getIt(),
        ),
        context);
    // Navigator.pushNamed(context, RouteName.search);
  }
}
