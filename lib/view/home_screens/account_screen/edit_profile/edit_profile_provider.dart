import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:wizmo/domain/app_repository.dart';
import 'package:wizmo/main.dart';
import 'package:wizmo/models/get_profile.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/utils/camera_choice.dart';
import 'package:wizmo/utils/flushbar.dart';
import 'package:wizmo/utils/navigator_class.dart';
import 'package:wizmo/view/home_screens/main_bottom_bar/main_bottom_bar.dart';

class EditProfileProvider with ChangeNotifier {
  AppRepository appRepository;
  EditProfileProvider({required this.appRepository});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool _obscure = true;
  bool get obscure => _obscure;
  bool _loading = false;
  bool get loading => _loading;
  final DateFormat formatter = DateFormat('dd-MM-yyyy', 'en_US');
  passHide() {
    obscure ? _obscure = false : _obscure = true;
    notifyListeners();
  }

  File? _image;
  File? get image => _image;
  imagePicker(
      {required BuildContext context,
      required EditProfileProvider provider}) async {
    CameraChoice()
        .cameraChoicePicker(context, MediaQuery.of(context).size, provider);
  }

  pickImageProviderUse(source) async {
    final XFile? file = await ImagePicker().pickImage(source: source);
    if (file != null) {
      _image = File(file.path);
      notifyListeners();
      print('picked');
    } else {
      print('Not Picked');
    }
  }

  profile({required UserProfil profile}) {
    nameController.text = profile.name.toString();
    emailController.text = profile.email.toString();
    phoneController.text = profile.phoneNumber.toString();
    dobController.text = profile.dateOfBirth.toString();
  }

  Future<DateTime?> slecteDtateTime(BuildContext context) => showDatePicker(
        context: context,
        // initialDate: DateTime(),
        firstDate: DateTime(2023),
        lastDate: DateTime(2030),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(primary: AppColors.buttonColor),
              buttonTheme:
                  const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child!,
          );
        },
      );
  updateProfile(
      {required Map detail,
      required String url,
      required BuildContext context}) async {
    _loading = true;
    notifyListeners();
    print(detail);
    var response;
    if (image != null) {
      response = await appRepository.postWithImage(
          url: url, context: context, details: detail);
    } else {
      response =
          await appRepository.post(url: url, context: context, details: detail);
    }
    print("EditProfileResponse$response");
    if (response != null) {
      // ignore: use_build_context_synchronously
      await FlushBarUtils.flushBar('Profile Updated', context, 'Successful');
      _loading = false;
      notifyListeners();
      navigateToAccountScreen(context);
    } else {
      _loading = false;
      notifyListeners();
    }
  }

  navigateToAccountScreen(BuildContext context) {
    Navigation().pushRep(MainBottomBar(provider: getIt(), index: 4), context);
  }
}
