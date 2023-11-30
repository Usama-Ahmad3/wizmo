import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wizmo/utils/camera_choice.dart';

class EditProfileProvider with ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool _obscure = true;
  bool get obscure => _obscure;
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
}
