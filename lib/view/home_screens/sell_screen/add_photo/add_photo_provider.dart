import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/utils/camera_choice.dart';

class AddPhotoProvider with ChangeNotifier {
  ///add photo
  List<File>? _image = [];
  List<File>? get image => _image;
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

  // imagePic(context) {
  //   showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: Text(
  //           "Upload Picture",
  //           style: Theme.of(context)
  //               .textTheme
  //               .headline2!
  //               .copyWith(color: AppColors.black),
  //         ),
  //         content: SingleChildScrollView(
  //           child: ListBody(
  //             children: [
  //               GestureDetector(
  //                   child: Text(
  //                     "Choose from gallery",
  //                     style: Theme.of(context)
  //                         .textTheme
  //                         .headline3!
  //                         .copyWith(
  //                         color: AppColors.black,
  //                         fontWeight: FontWeight.normal),
  //                   ),
  //                   onTap: () {
  //                     imagePicker(ImageSource.gallery);
  //                     Navigator.pop(context);
  //                   }),
  //               const Padding(
  //                 padding: EdgeInsets.all(8.0),
  //               ),
  //               GestureDetector(
  //                 child: Text("Take photo",
  //                     style: Theme.of(context)
  //                         .textTheme
  //                         .headline3!
  //                         .copyWith(
  //                         color: AppColors.black,
  //                         fontWeight: FontWeight.normal)),
  //                 onTap: () {
  //                   imagePicker(ImageSource.camera);
  //                   Navigator.pop(context);
  //                 },
  //               )
  //             ],
  //           ),
  //         ),
  //       ));
  // }
}
