import 'package:flutter/cupertino.dart';
import 'package:wizmo/main.dart';
import 'package:wizmo/models/sell_car_model.dart';
import 'package:wizmo/utils/navigator_class.dart';
import 'package:wizmo/view/home_screens/sell_screen/add_photo/add_photo.dart';

import 'decription_template.dart';

class DescriptionScreenProvider extends ChangeNotifier {
  TextEditingController descriptionController = TextEditingController();
  void autoDescription({required SellCarModel sellCarModel}) {
    if (sellCarModel.auto! == true) {
      sellCarModel.description = descriptionTemplate(sellCarModel);
    }
    descriptionController.text = sellCarModel.description.toString();
  }

  navigateToAddPhoto(
      {required BuildContext context, required SellCarModel sellCarModel}) {
    sellCarModel.description = descriptionController.text;
    Navigation()
        .push(AddPhoto(provider: getIt(), sellCarModel: sellCarModel), context);
  }

  navigateToBack({required BuildContext context}) {
    Navigation().pop(context);
  }
}
