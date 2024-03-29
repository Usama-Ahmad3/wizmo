import 'package:flutter/material.dart';
import 'package:wizmo/models/dynamic_car_detail_model.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/view/home_screens/home_screen/car_detail_screen/car_detail_provider.dart';

class ProfileCarDetail extends StatelessWidget {
  final DynamicCarDetailModel profile;
  final CarDetailProvider provider;
  bool auth;
  ProfileCarDetail(
      {super.key,
      required this.profile,
      required this.provider,
      this.auth = false});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Container(
        height: height * 0.09,
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
              backgroundImage: const AssetImage('assets/images/profile.jpeg'),
            ),
            title: Text(
              profile.sellerName.toString(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text(
              profile.location.toString().length > 40
                  ? profile.location.toString().substring(0, 40)
                  : profile.location.toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            trailing: InkWell(
              onTap: () {
                auth
                    ? provider.openMapSheet(context, profile.longitude,
                        profile.latitude, profile.location)
                    : provider.popupDialog(
                        context: context,
                        text: 'Login required',
                        buttonText: 'Login');
              },
              child: Text(
                "Direction",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            )),
      ),
    );
  }
}
