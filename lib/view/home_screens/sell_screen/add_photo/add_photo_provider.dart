import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wizmo/domain/app_repository.dart';
import 'package:wizmo/utils/camera_choice.dart';
import 'package:wizmo/utils/navigator_class.dart';
import 'package:wizmo/view/home_screens/sell_screen/congrats_screen/congrats_screen.dart';

class AddPhotoProvider with ChangeNotifier {
  AppRepository appRepository;
  AddPhotoProvider({required this.appRepository});

  ///add photo
  List<File>? _image = [];
  List<File>? get image => _image;
  bool _loading = false;
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
    var response =
        await appRepository.post(url: url, context: context, details: detail);
    print("response$response");
    if (response != null) {
      navigateToCongrats(context);
    }
    _loading = false;
    notifyListeners();
  }

  navigateToCongrats(BuildContext context) {
    Navigation().push(const CongratsScreen(), context);
  }
}
