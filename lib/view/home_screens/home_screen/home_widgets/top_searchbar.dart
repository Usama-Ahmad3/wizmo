import 'package:flutter/material.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/view/home_screens/home_screen/home_provider.dart';

class TopSearchBar extends StatelessWidget {
  HomeProvider value;
  TopSearchBar({super.key,required this.value});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.01),
      child: Material(
        color: AppColors.white,
        shadowColor: AppColors.shadowColor,
        borderRadius:
        BorderRadius.circular(height * 0.01),
        elevation: 6,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.03),
          child: SizedBox(
            height: height * 0.33,
            width: width,
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.012,
                      vertical: height * 0.01),
                  child: Text(
                    'Find your perfect car',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: AppColors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.01,
                      vertical: height * 0.01),
                  child: InkWell(
                    onTap: () {
                      value.selectChoice(
                          MediaQuery.of(context).size,
                          context,
                          'Make');
                    },
                    child: Container(
                      height: height * 0.052,
                      width: width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color:
                              AppColors.shadowColor,
                              blurRadius: 2,
                              blurStyle: BlurStyle.outer,
                              offset: const Offset(0, 0))
                        ],
                        borderRadius:
                        BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          value.make == ''
                              ? 'Select Make'
                              : value.make,
                          // title!.isEmpty?'Select Make':title,
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(
                              color: AppColors.black),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.01,
                      vertical: height * 0.01),
                  child: Container(
                    height: height * 0.052,
                    width: width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color:
                              AppColors.shadowColor,
                              blurRadius: 2,
                              blurStyle:
                              BlurStyle.outer,
                              offset:
                              const Offset(0, 0))
                        ],
                        borderRadius:
                        BorderRadius.circular(8)),
                    child: InkWell(
                      onTap: () {
                        value.selectChoice(
                            MediaQuery.of(context).size,
                            context,
                            'Model');
                      },
                      child: Center(
                        child: Text(
                          value.model == ''
                              ? 'Select Model'
                              : value.model,
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(
                              color:value.make ==
                                  ''
                                  ? AppColors.grey
                                  : AppColors
                                  .black),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.012,
                      vertical: height * 0.01),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          value.onRefresh();
                          value.flushBarUtils(
                              'Checking',
                              context,
                              'Test');
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.refresh),
                            Text('Refresh')
                          ],
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            value.navigateToSearch(1,context);
                          },
                          child:
                          const Text('More options'))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.01),
                  child: Container(
                    height: height * 0.06,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(25),
                      color: AppColors.buttonColor,
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search,
                            color: AppColors.white,
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          Text(
                            'Search ${value.countCars} cars',
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(
                                color:
                                AppColors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
