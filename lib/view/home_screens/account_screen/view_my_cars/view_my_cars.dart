import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizmo/main.dart';
import 'package:wizmo/res/common_widgets/cashed_image.dart';
import 'package:wizmo/utils/navigator_class.dart';
import 'package:wizmo/view/home_screens/account_screen/view_my_cars/view_my_cars_provider.dart';
import 'package:wizmo/view/home_screens/home_screen/car_detail_screen/car_detail_initials.dart';
import 'package:wizmo/view/home_screens/home_screen/car_detail_screen/car_detail_screen.dart';
import 'package:wizmo/view/home_screens/home_screen/car_detail_screen/story_page.dart';
import 'package:wizmo/view/home_screens/home_screen/home_widgets/car_container.dart';

import '../../../../res/colors/app_colors.dart';

class ViewMyCars extends StatelessWidget {
  ViewMyCars({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        appBar: AppBar(
          title: Text('My Cars'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ...List.generate(
                  image.length,
                  (index) => Consumer<ViewMyCarsProvider>(
                        builder: (context, value, child) => CarContainer(
                          image: image,
                          price: '3.599 \$',
                          name: 'BMW 3 Series 320',
                          model: '2007',
                          onTap: () {
                            var detail = CarDetailInitials(
                                name: 'BMW 3 Series 320',
                                price: '3.599 \$',
                                model: '2007',
                                image: image,
                                onTap: () {},
                                provider: getIt());
                            value.navigateToCarDetail(
                                detail: detail, context: context);
                          },
                        ),
                      )),
            ],
          ),
        ));
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
