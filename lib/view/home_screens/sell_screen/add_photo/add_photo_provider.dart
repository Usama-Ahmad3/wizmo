import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wizmo/domain/app_repository.dart';
import 'package:wizmo/models/get_profile.dart';
import 'package:wizmo/utils/camera_choice.dart';
import 'package:wizmo/utils/flushbar.dart';
import 'package:wizmo/utils/navigator_class.dart';
import 'package:wizmo/view/home_screens/sell_screen/congrats_screen/congrats_screen.dart';

class AddPhotoProvider with ChangeNotifier {
  AppRepository appRepository;
  AddPhotoProvider({required this.appRepository});
  GetProfile profile = GetProfile();

  ///add photo
  List<File>? _image = [];
  List<File>? get image => _image;
  bool _loading = true;
  bool get loading => _loading;
  removeImage(int index) {
    _image!.removeAt(index);
    notifyListeners();
  }

  imagePicker(
      {required BuildContext context,
      required AddPhotoProvider provider}) async {
    CameraChoice()
        .cameraChoicePicker(context, MediaQuery.of(context).size, provider);
  }

  pickImageProviderUse(source) async {
    final XFile? file = await ImagePicker().pickImage(source: source);
    if (file != null) {
      _image!.add(File(file.path));
      notifyListeners();
      print('picked');
    } else {
      print('Not Picked');
    }
  }

  Future addCarForSell(
      {required BuildContext context,
      required String url,
      required Map detail}) async {
    _loading = true;
    notifyListeners();
    var response = await appRepository.postWithImage(
        url: url, context: context, details: detail);
    print("response$response");
    if (response != null) {
      // ignore: use_build_context_synchronously
      navigateToCongrats(context);
      // ignore: use_build_context_synchronously
      await FlushBarUtils.flushBar(response['message'], context, 'Congrats');
    }
    _loading = false;
    notifyListeners();
  }

  navigateToCongrats(BuildContext context) {
    Navigation().push(const CongratsScreen(), context);
  }

  getProfile(
      {required BuildContext context,
      required String url,
      Map? details}) async {
    // _loading = true;
    // notifyListeners();
    var response =
        await appRepository.post(url: url, context: context, details: details);
    print(response);
    if (response != null) {
      profile = GetProfile.fromJson(response);
      _loading = false;
      notifyListeners();
    } else {
      _loading = false;
      // ignore: use_build_context_synchronously
      notifyListeners();
    }
  }
}
