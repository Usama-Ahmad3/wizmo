import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizmo/domain/app_repository.dart';
import 'package:wizmo/models/Car%20Favourites%20models/get_car_favourites.dart';
import 'package:wizmo/models/Car%20Favourites%20models/post_car_favourites.dart';
import 'package:wizmo/res/app_urls/app_urls.dart';
import 'package:wizmo/utils/flushbar.dart';
import 'package:wizmo/view/home_screens/save_screen/save_provider.dart';

class CarFavouritesProvider with ChangeNotifier {
  AppRepository appRepository;
  PostCarFavourites postCarFavourites;
  GetCarFavourites getCarFavourites;
  CarFavouritesProvider(
      {required this.appRepository,
      required this.postCarFavourites,
      required this.getCarFavourites});
  bool _loading = true;
  bool get loading => _loading;
  List<int> favoriteCarIds = [];
  int _id = 0;
  int get id => _id;
  favouriteCarsPost(
      {required BuildContext context,
      required String url,
      required Map details,
      required String localId}) async {
    _loading = true;
    notifyListeners();
    var response =
        await appRepository.post(url: url, context: context, details: details);
    if (kDebugMode) {
      print(response);
    }
    if (response != null) {
      try {
        favoriteCarIds.add(int.parse(localId));
        // ignore: use_build_context_synchronously
        await favouriteCarsGet(
            context: context, url: '${AppUrls.baseUrl}${AppUrls.getSavedCars}');
        _loading = false;
        notifyListeners();
        FlushBarUtils.flushBar('Successfully Saved', context, "Success");
        //  postCarFavourites = PostCarFavourites.fromJson(response);
      } catch (e) {
        if (kDebugMode) {
          print("Here is car's error $e");
        }
      }
    } else {
      FlushBarUtils.flushBar('Something Went Wrong', context, "Error");
      _loading = false;
      notifyListeners();
    }
  }
//

  favouriteCarsGet({required BuildContext context, required String url}) async {
    // _loading = true;
    // notifyListeners();
    var response =
        await appRepository.get(url: url, context: context, id: null);
    if (kDebugMode) {
      print('favoritejjjjjjjjjjjjjjjjj');
    }
    if (response != null) {
      try {
        getCarFavourites = GetCarFavourites.fromJson(response);
        favoriteCarIds.clear();
        for (int i = 0; i < getCarFavourites.cars!.length; i++) {
          favoriteCarIds.add(getCarFavourites.cars![i].carId!.toInt());
        }
        _loading = false;
        notifyListeners();
      } catch (e) {
        _loading = false;
        getCarFavourites.cars = [];
        print('wwwwwwwwwwwwwwwwwwwww');
        print(e);
        notifyListeners();
        if (kDebugMode) {
          print("Here is car's error $e");
        }
      }
    } else {
      getCarFavourites.cars = null;
      _loading = false;
      notifyListeners();
    }
  }
//

  favouriteCarsRemove({
    required BuildContext context,
    required String url,
    required String localId,
  }) async {
    getSavedIdsToRemove(localId);
    print('remove');
    print(localId);
    var response =
        await appRepository.get(url: url, context: context, id: id.toString());
    if (kDebugMode) {
      print(response);
    }
    if (response != null) {
      try {
        // getCarFavourites = GetCarFavourites.fromJson(response);
        favoriteCarIds.remove(int.parse(localId));
        // ignore: use_build_context_synchronously
        await favouriteCarsGet(
            context: context, url: '${AppUrls.baseUrl}${AppUrls.getSavedCars}');
      } catch (e) {
        _loading = false;
        notifyListeners();
        if (kDebugMode) {
          print("Here is car's error $e");
        }
      }
    } else {
      _loading = false;
      notifyListeners();
    }
  }

  getSavedIdsToRemove(String carId) {
    print('object');
    print(getCarFavourites.cars);
    print(carId);
    // if (getCarFavourites.cars != null) {
    print('ahhhhhhhhhhhhhhhhssssssssssssss');
    for (int i = 0; i < getCarFavourites.cars!.length; i++) {
      int current = getCarFavourites.cars![i].id!.toInt();
      if (getCarFavourites.cars![i].carId == int.parse(carId.toString())) {
        _id = getCarFavourites.cars![i].id!.toInt();
        print("id$id");
        // }
      }
    }
  }
}
