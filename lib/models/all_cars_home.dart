class AllCarsHome {
  AllCarsHome({
    num? status,
    List<Cars>? cars,
  }) {
    _status = status;
    _cars = cars;
  }

  AllCarsHome.fromJson(dynamic json) {
    _status = json['Status'];
    if (json['Cars'] != null) {
      _cars = [];
      json['Cars'].forEach((v) {
        _cars?.add(Cars.fromJson(v));
      });
    }
  }
  num? _status;
  List<Cars>? _cars;
  AllCarsHome copyWith({
    num? status,
    List<Cars>? cars,
  }) =>
      AllCarsHome(
        status: status ?? _status,
        cars: cars ?? _cars,
      );
  num? get status => _status;
  List<Cars>? get cars => _cars;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = _status;
    if (_cars != null) {
      map['Cars'] = _cars?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Cars {
  Cars({
    num? id,
    String? role,
    String? rgistraion,
    String? sellerType,
    String? carName,
    String? model,
    String? description,
    String? location,
    String? price,
    String? make,
    String? longitude,
    String? latitude,
    String? userEmail,
    String? userPhoneNumber,
    String? userAddress,
    String? userName,
    List<String>? carImages,
    List<String>? features,
  }) {
    _id = id;
    _role = role;
    _rgistraion = rgistraion;
    _sellerType = sellerType;
    _carName = carName;
    _model = model;
    _description = description;
    _location = location;
    _price = price;
    _make = make;
    _longitude = longitude;
    _latitude = latitude;
    _userEmail = userEmail;
    _userPhoneNumber = userPhoneNumber;
    _userAddress = userAddress;
    _userName = userName;
    _carImages = carImages;
    _features = features;
  }

  Cars.fromJson(dynamic json) {
    _id = json['id'];
    _role = json['role'];
    _rgistraion = json['rgistraion'];
    _sellerType = json['sellertype'];
    _carName = json['car_name'];
    _model = json['model'];
    _description = json['description'];
    _location = json['location'];
    _price = json['price'];
    _make = json['make'];
    _longitude = json['longitude'];
    _latitude = json['latitude'];
    _userName = json['user_name'];
    _userEmail = json['user_email'];
    _userPhoneNumber = json['user_phone_number'];
    _userAddress = json['user_address'];
    _carImages =
        json['car_images'] != null ? json['car_images'].cast<String>() : [];
    _features = json['features'] != null ? json['features'].cast<String>() : [];
  }
  num? _id;
  String? _role;
  String? _rgistraion;
  String? _sellerType;
  String? _carName;
  String? _model;
  String? _description;
  String? _location;
  String? _price;
  String? _make;
  String? _longitude;
  String? _latitude;
  String? _userName;
  String? _userEmail;
  String? _userPhoneNumber;
  String? _userAddress;
  List<String>? _carImages;
  List<String>? _features;
  Cars copyWith({
    num? id,
    String? role,
    String? rgistraion,
    String? sellerType,
    String? carName,
    String? model,
    String? description,
    String? location,
    String? price,
    String? make,
    String? longitude,
    String? latitude,
    String? userName,
    String? userEmail,
    String? userPhoneNumber,
    String? userAddress,
    List<String>? carImages,
    List<String>? features,
  }) =>
      Cars(
        id: id ?? _id,
        role: role ?? _role,
        rgistraion: rgistraion ?? _rgistraion,
        sellerType: sellerType ?? _sellerType,
        carName: carName ?? _carName,
        model: model ?? _model,
        description: description ?? _description,
        location: location ?? _location,
        price: price ?? _price,
        make: make ?? _make,
        longitude: longitude ?? _longitude,
        latitude: latitude ?? _latitude,
        userAddress: userAddress ?? _userAddress,
        userEmail: userEmail ?? _userEmail,
        userName: userName ?? _userName,
        userPhoneNumber: userPhoneNumber ?? _userPhoneNumber,
        carImages: carImages ?? _carImages,
        features: features ?? _features,
      );
  num? get id => _id;
  String? get role => _role;
  String? get rgistraion => _rgistraion;
  String? get sellerType => _sellerType;
  String? get carName => _carName;
  String? get model => _model;
  String? get description => _description;
  String? get location => _location;
  String? get price => _price;
  String? get make => _make;
  String? get longitude => _longitude;
  String? get latitude => _latitude;
  String? get userName => _userName;
  String? get userEmail => _userEmail;
  String? get userAddress => _userAddress;
  String? get userPhoneNumber => _userPhoneNumber;
  List<String>? get carImages => _carImages;
  List<String>? get features => _features;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['role'] = _role;
    map['rgistraion'] = _rgistraion;
    map['seller_type'] = _sellerType;
    map['car_name'] = _carName;
    map['model'] = _model;
    map['description'] = _description;
    map['location'] = _location;
    map['price'] = _price;
    map['make'] = _make;
    map['longitude'] = _longitude;
    map['latitude'] = _latitude;
    map['user_name'] = _userName;
    map['user_email'] = _userEmail;
    map['user_phone_number'] = _userPhoneNumber;
    map['user_address'] = _userAddress;
    map['car_images'] = _carImages;
    map['features'] = _features;
    return map;
  }
}
