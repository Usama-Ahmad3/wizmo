import 'package:flutter/material.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/view/home_screens/account_screen/account_screen_provider.dart';

class AccountScreen extends StatefulWidget {
  AccountScreenProvider provider;
  AccountScreen({super.key, required this.provider});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  void initState() {
    print('In the Account Screen');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: DefaultTextStyle(
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: AppColors.grey),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Text(
                    'Hi Usama,',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: AppColors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Text(
                    'Welcome To Wizmo',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Center(
                  child: SizedBox(
                    width: width * 0.91,
                    child: Divider(
                      color: AppColors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05, vertical: height * 0.02),
                  child: const Text(
                    "Account",
                  ),
                ),

                ///Account
                ...List.generate(
                    3,
                    (index) => Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: height * 0.013,
                              horizontal: width * 0.05),
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColors.shadowColor
                                          .withOpacity(0.17),
                                      blurStyle: BlurStyle.normal,
                                      offset: const Offset(1, 1),
                                      blurRadius: 12,
                                      spreadRadius: 2)
                                ],
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              onTap: index == 0
                                  ? () {
                                      widget.provider
                                          .navigateToEditProfile(context);
                                    }
                                  : index == 1
                                      ? () {
                                          widget.provider
                                              .navigateToMyCars(context);
                                        }
                                      : () {
                                          widget.provider
                                              .navigateToSavedCars(context);
                                        },
                              titleAlignment: ListTileTitleAlignment.center,
                              leading: Icon(
                                icon[index],
                                color: AppColors.black,
                              ),
                              titleTextStyle: const TextStyle(
                                  leadingDistribution:
                                      TextLeadingDistribution.even),
                              title: Text(
                                title[index],
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              trailing: Icon(Icons.keyboard_arrow_right,
                                  color: AppColors.black),
                            ),
                          ),
                        )),
                SizedBox(
                  height: height * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05, vertical: height * 0.02),
                  child: const Text(
                    "Support",
                  ),
                ),

                ///Support
                ...List.generate(
                    2,
                    (index) => Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: height * 0.013,
                              horizontal: width * 0.05),
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColors.shadowColor
                                          .withOpacity(0.17),
                                      blurStyle: BlurStyle.normal,
                                      offset: const Offset(1, 1),
                                      blurRadius: 12,
                                      spreadRadius: 2)
                                ],
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              onTap: () {},
                              titleAlignment: ListTileTitleAlignment.center,
                              leading: Icon(
                                sIcon[index],
                                color: AppColors.black,
                              ),
                              titleTextStyle: const TextStyle(
                                  leadingDistribution:
                                      TextLeadingDistribution.even),
                              title: Text(
                                sTitle[index],
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              trailing: Icon(Icons.keyboard_arrow_right,
                                  color: AppColors.black),
                            ),
                          ),
                        )),
                SizedBox(
                  height: height * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05, vertical: height * 0.02),
                  child: const Text(
                    "Others",
                  ),
                ),

                ///Others
                ...List.generate(
                    2,
                    (index) => Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: height * 0.013,
                              horizontal: width * 0.05),
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColors.shadowColor
                                          .withOpacity(0.17),
                                      blurStyle: BlurStyle.normal,
                                      offset: const Offset(1, 1),
                                      blurRadius: 12,
                                      spreadRadius: 2)
                                ],
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              onTap: () {},
                              titleAlignment: ListTileTitleAlignment.center,
                              leading: Icon(
                                oIcon[index],
                                color: AppColors.red,
                              ),
                              titleTextStyle: const TextStyle(
                                  leadingDistribution:
                                      TextLeadingDistribution.even),
                              title: Text(
                                oTitle[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(color: AppColors.red),
                              ),
                              trailing: Icon(Icons.keyboard_arrow_right,
                                  color: AppColors.red),
                            ),
                          ),
                        )),
                SizedBox(
                  height: height * 0.013,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List icon = [Icons.person, Icons.car_crash_sharp, Icons.favorite];
  List title = ["Edit Profile", 'View My Cars', "Saved Cars"];
  List sIcon = [Icons.info_outline, Icons.call];
  List sTitle = ['Help', 'Contact Us'];
  List oIcon = [Icons.logout_outlined, Icons.delete_forever_outlined];
  List oTitle = ['Logout', 'Delete Account'];
}
