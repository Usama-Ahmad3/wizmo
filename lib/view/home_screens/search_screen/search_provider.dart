import 'package:flutter/cupertino.dart';
import 'package:wizmo/domain/app_repository.dart';
import 'package:wizmo/models/selling_models/car_model.dart';
import 'package:wizmo/utils/navigator_class.dart';
import 'package:wizmo/view/home_screens/search_screen/filter_cars/filter_cars.dart';

class SearchProvider extends ChangeNotifier {
  AppRepository appRepository;
  CarModel carModel;
  SearchProvider({required this.appRepository, required this.carModel});
  List models = ['car', 'boo', 'model', 'a5', 'w2', 'e4', 'a6', 'h6', 'high'];
  List ab = [];
  List abc = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'x',
    'y',
    'z'
  ];
  bool _loading = true;
  bool get loading => _loading;
  Future getModel(
      {required loginDetails, required url, required context}) async {
    var response = await appRepository.post(
        url: url, context: context, details: loginDetails);
    print("response$response");
    if (response != null) {
      carModel = CarModel.fromJson(response);
    }
    _loading = false;
    notifyListeners();
  }

  searchTitles() {
    for (int i = 0; i < carModel.model!.length; i++) {
      abc.forEach((element) {
        if (element.toString().toLowerCase() ==
            carModel.model![i].model![0].toLowerCase()) {
          ab.add(element);
        }
      });
    }
  }
  navigateToFilterScreen({required String title,required String model,required BuildContext context}){
    Navigation().push(FilterCars(title: title,model:model), context);
  }
}
