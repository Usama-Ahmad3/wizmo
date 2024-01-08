class MyAllCarModel {
  MyAllCarModel({
    List<SellerCars>? sellerCars,
  }) {
    _sellerCars = sellerCars;
  }

  MyAllCarModel.fromJson(dynamic json) {
    if (json['seller_cars'] != null) {
      _sellerCars = [];
      json['seller_cars'].forEach((v) {
        _sellerCars?.add(SellerCars.fromJson(v));
      });
    }
  }
  List<SellerCars>? _sellerCars;
  MyAllCarModel copyWith({
    List<SellerCars>? sellerCars,
  }) =>
      MyAllCarModel(
        sellerCars: sellerCars ?? _sellerCars,
      );
  List<SellerCars>? get sellerCars => _sellerCars;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_sellerCars != null) {
      map['seller_cars'] = _sellerCars?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class SellerCars {
  SellerCars({
    num? id,
    String? sellerType,
    String? carName,
    String? model,
    String? description,
    dynamic location,
    String? price,
    String? longitude,
    String? latitude,
    String? createdAt,
    String? updatedAt,
    List<String>? carImages,
    List<String>? featuresName,
    List<String>? features,
  }) {
    _id = id;
    _sellerType = sellerType;
    _carName = carName;
    _model = model;
    _description = description;
    _location = location;
    _price = price;
    _longitude = longitude;
    _latitude = latitude;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _carImages = carImages;
    _featuresName = featuresName;
    _features = features;
  }

  SellerCars.fromJson(dynamic json) {
    _id = json['id'];
    _sellerType = json['seller_type'];
    _carName = json['car_name'];
    _model = json['model'];
    _description = json['description'];
    _location = json['location'];
    _price = json['price'];
    _longitude = json['longitude'];
    _latitude = json['latitude'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _carImages =
        json['car_images'] != null ? json['car_images'].cast<String>() : [];
    _featuresName = json['features_name'] != null
        ? json['features_name'].cast<String>()
        : [];
    _features = json['features'] != null ? json['features'].cast<String>() : [];
  }
  num? _id;
  String? _sellerType;
  String? _carName;
  String? _model;
  String? _description;
  dynamic _location;
  String? _price;
  String? _longitude;
  String? _latitude;
  String? _createdAt;
  String? _updatedAt;
  List<String>? _carImages;
  List<String>? _featuresName;
  List<String>? _features;
  SellerCars copyWith({
    num? id,
    String? sellerType,
    String? carName,
    String? model,
    String? description,
    dynamic location,
    String? price,
    String? longitude,
    String? latitude,
    String? createdAt,
    String? updatedAt,
    List<String>? carImages,
    List<String>? featuresName,
    List<String>? features,
  }) =>
      SellerCars(
        id: id ?? _id,
        sellerType: sellerType ?? _sellerType,
        carName: carName ?? _carName,
        model: model ?? _model,
        description: description ?? _description,
        location: location ?? _location,
        price: price ?? _price,
        longitude: longitude ?? _longitude,
        latitude: latitude ?? _latitude,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        carImages: carImages ?? _carImages,
        featuresName: featuresName ?? _featuresName,
        features: features ?? _features,
      );
  num? get id => _id;
  String? get sellerType => _sellerType;
  String? get carName => _carName;
  String? get model => _model;
  String? get description => _description;
  dynamic get location => _location;
  String? get price => _price;
  String? get longitude => _longitude;
  String? get latitude => _latitude;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  List<String>? get carImages => _carImages;
  List<String>? get featuresName => _featuresName;
  List<String>? get features => _features;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['seller_type'] = _sellerType;
    map['car_name'] = _carName;
    map['model'] = _model;
    map['description'] = _description;
    map['location'] = _location;
    map['price'] = _price;
    map['longitude'] = _longitude;
    map['latitude'] = _latitude;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['car_images'] = _carImages;
    map['features_name'] = _featuresName;
    map['features'] = _features;
    return map;
  }
}
