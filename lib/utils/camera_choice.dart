import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wizmo/res/colors/app_colors.dart';

class CameraChoice {
  cameraChoicePicker(context, size, provider) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Select Choice',
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: AppColors.white),
        ),
        elevation: 5,
        backgroundColor: AppColors.shadowColor.withOpacity(0.1),
        contentPadding: EdgeInsets.symmetric(
            vertical: size.height * 0.03, horizontal: size.width * 0.01),
        content: SizedBox(
          height: size.height * 0.14,
          child: Column(
            children: [
              ListTile(
                  onTap: () {
                    provider.pickImageProviderUse(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                  textColor: AppColors.white,
                  trailing: Icon(Icons.collections, color: AppColors.white),
                  title: Text(
                    'Pick From Gallery',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: AppColors.white),
                  )),
              ListTile(
                  onTap: () {
                    provider.pickImageProviderUse(ImageSource.camera);
                    Navigator.pop(context);
                  },
                  trailing: Icon(
                    Icons.camera_alt_rounded,
                    color: AppColors.white,
                  ),
                  title: Text(
                    'Capture From Camera',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: AppColors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
