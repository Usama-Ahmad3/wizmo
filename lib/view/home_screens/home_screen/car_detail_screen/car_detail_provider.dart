

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wizmo/domain/app_repository.dart';
import 'package:wizmo/models/get_profile.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/utils/flushbar.dart';

class CarDetailProvider with ChangeNotifier {
  AppRepository appRepository;
  CarDetailProvider({required this.appRepository});
  GetProfile profile = GetProfile();
  bool _loading = false;
  bool get loading => _loading;
  bool _viewMore = false;
  bool get viewMore => _viewMore;

  ///TODO later
  String location = "London, UK";
  String name = "Brian P.Berry";
  String image = "assets/images/profile.jpeg";
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
  onClick() {
    _viewMore = !_viewMore;
    notifyListeners();
  }

  var isDialOpen = ValueNotifier<bool>(false);
  onTapSpeed() {
    isDialOpen.value = !isDialOpen.value;
    notifyListeners();
  }

  Future<void> launchInBrowser(String url, context) async {
    try {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } catch (e) {
      FlushBarUtils.flushBar(e.toString(), context, 'Could not launch $url');
    }
  }

  Future<void> makePhoneCall(String url, context) async {
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      FlushBarUtils.flushBar(e.toString(), context, 'Could not launch');
      print("Exception$e");
    }
  }

  openMapSheet(context, longitude, latitude, location) async {
    try {
      final availableMaps = await MapLauncher.installedMaps;
      showBottomSheet(
          context: context,
          backgroundColor: AppColors.buttonColor,
          enableDrag: true,
          builder: (context) {
            return SingleChildScrollView(
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Wrap(
                    children: [
                      for (var map in availableMaps)
                        ListTile(
                          onTap: () => map.showMarker(
                            coords: Coords(double.parse(longitude),
                                double.parse(latitude)),
                            title: location,
                          ),
                          title: Text(
                            map.mapName,
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(color: AppColors.white),
                          ),
                          leading: SvgPicture.asset(
                            map.icon,
                            height: 30.0,
                            width: 30.0,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          });
    } catch (e) {
      print(e);
      FlushBarUtils.flushBar('Error While Opening Map', context, "Error");
    }
  }

  Future getProfile(
      {required BuildContext context,
      required String url,
      Map? details}) async {
    // _loading = true;
    // notifyListeners();
    var response =
        await appRepository.post(url: url, context: context, details: details);
    print(response);
    if (response != null) {
      profile = await GetProfile.fromJson(response);
    } else {
      _loading = false;
      // ignore: use_build_context_synchronously
      notifyListeners();
    }
    _loading = false;
    notifyListeners();
  }
}
