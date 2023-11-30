import 'package:flutter/foundation.dart';

import 'car_detail_provider.dart';

class CarDetailInitials {
  String name;
  String price;
  List image;
  String model;
  VoidCallback onTap;
  bool? isFavourite;
  CarDetailProvider provider;

  CarDetailInitials(
      {required this.name,
      required this.price,
      required this.image,
      required this.model,
      required this.onTap,
      required this.provider,
      this.isFavourite});
}
