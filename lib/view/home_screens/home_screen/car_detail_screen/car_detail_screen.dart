import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/utils/navigator_class.dart';
import 'package:wizmo/view/home_screens/home_screen/car_detail_screen/car_detail_initials.dart';
import 'package:wizmo/view/home_screens/home_screen/car_detail_screen/car_detail_provider.dart';
import 'package:wizmo/view/home_screens/home_screen/car_detail_screen/story_page.dart';
import 'package:wizmo/view/home_screens/home_screen/home_widgets/car_container.dart';

class CarDetailScreen extends StatefulWidget {
  CarDetailInitials carDetailInitials;
  CarDetailScreen({super.key, required this.carDetailInitials});

  @override
  State<CarDetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<CarDetailScreen> {
  @override
  void initState() {
    print('In The Car Detail Screen');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Details'),
      ),
      floatingActionButton:
          Consumer<CarDetailProvider>(builder: (context, value, child) {
        return SpeedDial(
          elevation: 3,
          label: Text(
            'Message Seller',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: AppColors.white),
          ),
          animationCurve: Curves.easeInOutCirc,
          backgroundColor: AppColors.buttonColor,
          openCloseDial: value.isDialOpen,
          animationDuration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutBack,
          mini: false,
          closeManually: true,
          isOpenOnStart: false,
          onPress: () {
            value.onTapSpeed();
          },
          useRotationAnimation: true,
          childrenButtonSize: Size(width * 0.17, height * 0.065),
          childMargin: EdgeInsets.symmetric(
              horizontal: width * 0.05, vertical: height * 0.014),
          children: [
            SpeedDialChild(
                onTap: () async {
                  print("WhatsApp");
                  const link = WhatsAppUnilink(
                      text: 'hi! how are you', phoneNumber: '03131616379');
                  value.launchInBrowser("$link", context);
                },
                child: const Icon(
                  FontAwesomeIcons.whatsapp,
                ),
                label: 'WhatsApp',
                labelStyle: Theme.of(context).textTheme.headline3,
                elevation: 3),
            SpeedDialChild(
                onTap: () {
                  print("Email");
                  value.launchInBrowser(
                      'mailto:usama.ahmad4357@gmail.com', context);
                },
                child: const Icon(
                  Icons.email_outlined,
                ),
                label: 'Email',
                labelStyle: Theme.of(context).textTheme.headline3,
                elevation: 3),
            SpeedDialChild(
                onTap: () {
                  print('phone');
                  value.makePhoneCall('tel:', context);
                },
                child: const Icon(
                  Icons.phone,
                ),
                label: 'Phone',
                labelStyle: Theme.of(context).textTheme.headline3,
                elevation: 3),
          ],
          activeChild: Icon(
            Icons.clear,
            color: AppColors.white,
            size: height * 0.03,
          ),
          child: Icon(
            Icons.messenger_outline,
            color: AppColors.white,
            size: height * 0.03,
          ),
        );
      }),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarContainer(
              onTap: () {
                navigateToStory();
              },
              model: widget.carDetailInitials.model,
              name: widget.carDetailInitials.name,
              image: widget.carDetailInitials.image,
              price: widget.carDetailInitials.price,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Features and Specifications',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: AppColors.black),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.015,
            ),
            Consumer<CarDetailProvider>(builder: (context, value, child) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      children: [
                        ...List.generate(
                            value.viewMore ? featureNames.length : 4,
                            (index) => Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.025,
                                      vertical: height * 0.003),
                                  child: SizedBox(
                                    height: height * 0.08,
                                    width: width * 0.4,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          featureNames[index],
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3,
                                        ),
                                        SizedBox(
                                          height: height * 0.003,
                                        ),
                                        Container(
                                          height: height * 0.05,
                                          width: width * 0.4,
                                          decoration: BoxDecoration(
                                              color: AppColors.teal,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      height * 0.01)),
                                          child: Center(
                                            child: Text(
                                              '4',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline2!
                                                  .copyWith(
                                                      color: AppColors.white),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    InkWell(
                      onTap: () {
                        value.onClick();
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: width * 0.023),
                        child: Text(
                          value.viewMore ? 'View Less' : 'View More',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: AppColors.black),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
            SizedBox(
              height: height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Description',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: AppColors.black),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: ReadMoreText(
                "This Flutter package simplifies text rendering with embedded URLs, enabling users to tap on any URL within the text to open the link.",
                trimLength: 2,
                trimMode: TrimMode.Line,
                lessStyle: TextStyle(
                    color: AppColors.black, fontWeight: FontWeight.bold),
                moreStyle: TextStyle(
                    color: AppColors.black, fontWeight: FontWeight.bold),
                trimCollapsedText: 'See More',
                trimExpandedText: 'See Less',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: AppColors.black),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'About This Seller',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: AppColors.black),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Container(
                height: height * 0.08,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.shadowColor.withOpacity(0.17),
                        blurStyle: BlurStyle.normal,
                        offset: const Offset(1, 1),
                        blurRadius: 12,
                        spreadRadius: 2)
                  ],
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                    leading: CircleAvatar(
                      radius: height * 0.023,
                      backgroundImage:
                          const AssetImage("assets/images/profile.jpeg"),
                    ),
                    title: Text(
                      "Brian P.Berry",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      "London, UK",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    trailing: Text(
                      "Direction",
                      style: Theme.of(context).textTheme.titleMedium,
                    )),
              ),
            ),
            SizedBox(
              height: height * 0.07,
            ),
          ],
        ),
      ),
    );
  }

  navigateToStory() {
    Navigation()
        .push(StoryPage(files: widget.carDetailInitials.image), context);
  }

  List featureNames = [
    'Model',
    'body_type',
    'acceleration',
    'drivetrain',
    'co2',
    'transmission',
    'fuel type',
    'fuel consumption',
    'engine size',
    'engine power',
    'mileage',
    'gearbox',
    'colour',
    'doors',
    'seats'
  ];
}
