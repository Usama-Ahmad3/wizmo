import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wizmo/domain/app_repository.dart';
import 'package:wizmo/models/Car%20Favourites%20models/get_car_favourites.dart';
import 'package:wizmo/models/Car%20Favourites%20models/post_car_favourites.dart';
import 'package:wizmo/utils/flushbar.dart';

class CarFavouritesProvider with ChangeNotifier {
  AppRepository appRepository;
  PostCarFavourites postCarFavourites = PostCarFavourites();
  GetCarFavourites getCarFavourites = GetCarFavourites();
  bool _loading = true;
  bool get loading => _loading;
  CarFavouritesProvider({required this.appRepository});

  favouriteCarsPost(context, {String? url, Map? details}) async {
    var response =
        await appRepository.post(url: url!, context: context, details: details);
    if (kDebugMode) {
      print(response);
    }
    if (response != null) {
      try {
        FlushBarUtils.flushBar('Successfully Saved', context, "Success");
      //  postCarFavourites = PostCarFavourites.fromJson(response);
        _loading = false;
        notifyListeners();
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

  favouriteCarsGet({required BuildContext context,required String url }) async {
    var response =
        await appRepository.get(url: url, context: context,id: null);
    if (kDebugMode) {
      print(response);
    }
    if (response != null) {
      try {
        getCarFavourites = GetCarFavourites.fromJson(response);
        _loading = false;
        notifyListeners();
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
//

favouriteCarsRemove({required BuildContext context,required String url,required String id}) async {
    var response =
        await appRepository.get(url: url, context: context,id: id);
    if (kDebugMode) {
      print(response);
    }
    if (response != null) {
      try {
        getCarFavourites = GetCarFavourites.fromJson(response);
        _loading = false;
        notifyListeners();
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
}
