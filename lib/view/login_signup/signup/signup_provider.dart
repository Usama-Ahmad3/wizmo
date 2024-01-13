import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:wizmo/domain/app_repository.dart';
import 'package:wizmo/main.dart';
import 'package:wizmo/res/authentication/authentication.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/utils/camera_choice.dart';
import 'package:wizmo/utils/flushbar.dart';
import 'package:wizmo/utils/navigator_class.dart';
import 'package:wizmo/view/login_signup/login/login.dart';

class SignUpProvider extends ChangeNotifier {
  AppRepository appRepository;
  SignUpProvider({required this.appRepository});
  var nameController = TextEditingController();
  var addressController = TextEditingController();
  var contactController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var licenseController = TextEditingController();
  var idCardController = TextEditingController();
  var dobController = TextEditingController();
  bool _obscure = true;
  bool _loading = false;
  bool get loading => _loading;
  bool get obscure => _obscure;
  File? _image;
  final DateFormat formatter = DateFormat('dd-MM-yyyy', 'en_US');
  File? get image => _image;
  
  imagePicker(
      {required BuildContext context, required SignUpProvider provider}) async {
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

  test() {
    print(nameController.text);
    notifyListeners();
  }

  passHide() {
    obscure ? _obscure = false : _obscure = true;
    notifyListeners();
  }

  Authentication authentication = Authentication();
  signup({required signupDetails, required url, required context}) async {
    _loading = true;
    notifyListeners();
    var response = await appRepository.postWithImage(
        url: url, context: context, details: signupDetails);
    print("SignUpResponse$response");
    print('ssjsj');
    if (response != null) {
      await FlushBarUtils.flushBar(
          'Wait to approve from admin, it will take up to maximum 24 hours',
          context,
          'Request Send');
      _loading = false;
      notifyListeners();
      navigateToLogin(context);
    } else {
      _loading = false;
      notifyListeners();
    }
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

  navigateToLogin(BuildContext context) {
    Navigation().pushRep(LogIn(provider: getIt()), context);
  }
}
