import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpProvider extends ChangeNotifier {
  var nameController = TextEditingController();
  var addressController = TextEditingController();
  var contactController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var licenseController = TextEditingController();
  var idCardController = TextEditingController();
  var dobController = TextEditingController();
  bool _obscure = true;
  bool get obscure => _obscure;
  File? _image;
  File? get image => _image;
  imagePicker(source) async {
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
}
