import 'package:flutter/foundation.dart';
import 'package:wizmo/models/dynamic_car_detail_model.dart';

import 'car_detail_provider.dart';

class CarDetailInitials {
  DynamicCarDetailModel carDetails;
  VoidCallback onTap;
  bool? isFavourite;
  String? location;
  String? latitude;
  String? longitude;
  bool myCars;
  String? sellerType;
  CarDetailProvider provider;
  List? features;
  List? featureName;

  CarDetailInitials(
      {required this.carDetails,
      required this.onTap,
      this.features,
      this.myCars = false,
      this.location,
      this.sellerType,
      this.longitude,
      this.latitude,
      required this.provider,
      this.featureName,
      this.isFavourite});
}
