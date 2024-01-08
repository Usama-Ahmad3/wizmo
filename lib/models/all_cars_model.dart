class AllCarsModel {
  AllCarsModel({
    num? status,
    List<Cars>? cars,
  }) {
    _cars = cars;
  }

  AllCarsModel.fromJson(dynamic json) {
    if (json['Cars'] != null) {
      _cars = [];
      json['Cars'].forEach((v) {
        _cars?.add(Cars.fromJson(v));
      });
    }
    _status = json['status'];
  }
  List<Cars>? _cars;
  num? _status;
  AllCarsModel copyWith({
    List<Cars>? cars,
    num? status,
  }) =>
      AllCarsModel(
        cars: cars ?? _cars,
        status: status ?? _status,
      );
  List<Cars>? get cars => _cars;
  num? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_cars != null) {
      map['Cars'] = _cars?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    return map;
  }
}

class Cars {
  Cars({
    num? id,
    String? price,
    String? range,
    String? location,
    String? description,
    String? carName,
    String? longitude,
    String? latitude,
    List<String>? image,
    Make? make,
    ModelList? modelList,
    List<Features>? features,
  }) {
    _id = id;
    _price = price;
    _range = range;
    _location = location;
    _description = description;
    _carName = carName;
    _longitude = longitude;
    _latitude = latitude;
    _image = image;
    _make = make;
    _modelList = modelList;
    _features = features;
  }

  Cars.fromJson(dynamic json) {
    _id = json['id'];
    _price = json['price'];
    _range = json['range'];
    _location = json['location'];
    _description = json['description'];
    _carName = json['car_name'];
    _longitude = json['longitude'];
    _latitude = json['latitude'];
    _image = json['image'] != null ? json['image'].cast<String>() : [];
    _make = json['make'] != null ? Make.fromJson(json['make']) : null;
    _modelList = json['modelList'] != null
        ? ModelList.fromJson(json['modelList'])
        : null;
    if (json['features'] != null) {
      _features = [];
      json['features'].forEach((v) {
        _features?.add(Features.fromJson(v));
      });
    }
  }
  num? _id;
  String? _price;
  String? _range;
  String? _location;
  String? _description;
  String? _carName;
  String? _longitude;
  String? _latitude;
  List<String>? _image;
  Make? _make;
  ModelList? _modelList;
  List<Features>? _features;
  Cars copyWith({
    num? id,
    String? price,
    String? range,
    String? location,
    String? description,
    String? carName,
    String? longitude,
    String? latitude,
    List<String>? image,
    Make? make,
    ModelList? modelList,
    List<Features>? features,
  }) =>
      Cars(
        id: id ?? _id,
        price: price ?? _price,
        range: range ?? _range,
        location: location ?? _location,
        description: description ?? _description,
        carName: carName ?? _carName,
        longitude: longitude ?? _longitude,
        latitude: latitude ?? _latitude,
        image: image ?? _image,
        make: make ?? _make,
        modelList: modelList ?? _modelList,
        features: features ?? _features,
      );
  num? get id => _id;
  String? get price => _price;
  String? get range => _range;
  String? get location => _location;
  String? get description => _description;
  String? get carName => _carName;
  String? get longitude => _longitude;
  String? get latitude => _latitude;
  List<String>? get image => _image;
  Make? get make => _make;
  ModelList? get modelList => _modelList;
  List<Features>? get features => _features;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['price'] = _price;
    map['range'] = _range;
    map['location'] = _location;
    map['description'] = _description;
    map['car_name'] = _carName;
    map['longitude'] = _longitude;
    map['latitude'] = _latitude;
    map['image'] = _image;
    if (_make != null) {
      map['make'] = _make?.toJson();
    }
    map['modelList'] = _modelList?.toJson();
    if (_features != null) {
      map['features'] = _features?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Features {
  Features({
    Make? make,
    ModelList? modelList,
    Year? year,
    ModelVariation? modelVariation,
    Mileage? mileage,
    BodyType? bodyType,
    FuelType? fuelType,
    EngineSize? engineSize,
    EnginePower? enginePower,
    FuelConsumption? fuelConsumption,
    Acceleration? acceleration,
    Gearbox? gearbox,
    Drivetrain? drivetrain,
    Co? co,
    Door? door,
    Seat? seat,
    InsuranceGroup? insuranceGroup,
    Tax? tax,
    SellerType? sellerType,
    Color? color,
  }) {
    _make = make;
    _modelList = modelList;
    _year = year;
    _modelVariation = modelVariation;
    _mileage = mileage;
    _bodyType = bodyType;
    _fuelType = fuelType;
    _engineSize = engineSize;
    _enginePower = enginePower;
    _fuelConsumption = fuelConsumption;
    _acceleration = acceleration;
    _gearbox = gearbox;
    _drivetrain = drivetrain;
    _co = co;
    _door = door;
    _seat = seat;
    _insuranceGroup = insuranceGroup;
    _tax = tax;
    _sellerType = sellerType;
    _color = color;
  }

  Features.fromJson(dynamic json) {
    _make = json['make'] != null ? Make.fromJson(json['make']) : null;
    _modelList = json['modelList'] != null
        ? ModelList.fromJson(json['modelList'])
        : null;
    _year = json['year'] != null ? Year.fromJson(json['year']) : null;
    _modelVariation = json['modelVariation'] != null
        ? ModelVariation.fromJson(json['modelVariation'])
        : null;
    _mileage =
        json['mileage'] != null ? Mileage.fromJson(json['mileage']) : null;
    _bodyType =
        json['bodyType'] != null ? BodyType.fromJson(json['bodyType']) : null;
    _fuelType =
        json['fuelType'] != null ? FuelType.fromJson(json['fuelType']) : null;
    _engineSize = json['engineSize'] != null
        ? EngineSize.fromJson(json['engineSize'])
        : null;
    _enginePower = json['enginePower'] != null
        ? EnginePower.fromJson(json['enginePower'])
        : null;
    _fuelConsumption = json['fuelConsumption'] != null
        ? FuelConsumption.fromJson(json['fuelConsumption'])
        : null;
    _acceleration = json['acceleration'] != null
        ? Acceleration.fromJson(json['acceleration'])
        : null;
    _gearbox =
        json['gearbox'] != null ? Gearbox.fromJson(json['gearbox']) : null;
    _drivetrain = json['drivetrain'] != null
        ? Drivetrain.fromJson(json['drivetrain'])
        : null;
    _co = json['co'] != null ? Co.fromJson(json['co']) : null;
    _door = json['door'] != null ? Door.fromJson(json['door']) : null;
    _seat = json['seat'] != null ? Seat.fromJson(json['seat']) : null;
    _insuranceGroup = json['insuranceGroup'] != null
        ? InsuranceGroup.fromJson(json['insuranceGroup'])
        : null;
    _tax = json['tax'] != null ? Tax.fromJson(json['tax']) : null;
    _sellerType = json['sellerType'] != null
        ? SellerType.fromJson(json['sellerType'])
        : null;
    _color = json['color'] != null ? Color.fromJson(json['color']) : null;
  }
  Make? _make;
  ModelList? _modelList;
  Year? _year;
  ModelVariation? _modelVariation;
  Mileage? _mileage;
  BodyType? _bodyType;
  FuelType? _fuelType;
  EngineSize? _engineSize;
  EnginePower? _enginePower;
  FuelConsumption? _fuelConsumption;
  Acceleration? _acceleration;
  Gearbox? _gearbox;
  Drivetrain? _drivetrain;
  Co? _co;
  Door? _door;
  Seat? _seat;
  InsuranceGroup? _insuranceGroup;
  Tax? _tax;
  SellerType? _sellerType;
  Color? _color;
  Features copyWith({
    Make? make,
    ModelList? modelList,
    Year? year,
    ModelVariation? modelVariation,
    Mileage? mileage,
    BodyType? bodyType,
    FuelType? fuelType,
    EngineSize? engineSize,
    EnginePower? enginePower,
    FuelConsumption? fuelConsumption,
    Acceleration? acceleration,
    Gearbox? gearbox,
    Drivetrain? drivetrain,
    Co? co,
    Door? door,
    Seat? seat,
    InsuranceGroup? insuranceGroup,
    Tax? tax,
    SellerType? sellerType,
    Color? color,
  }) =>
      Features(
        make: make ?? _make,
        modelList: modelList ?? _modelList,
        year: year ?? _year,
        modelVariation: modelVariation ?? _modelVariation,
        mileage: mileage ?? _mileage,
        bodyType: bodyType ?? _bodyType,
        fuelType: fuelType ?? _fuelType,
        engineSize: engineSize ?? _engineSize,
        enginePower: enginePower ?? _enginePower,
        fuelConsumption: fuelConsumption ?? _fuelConsumption,
        acceleration: acceleration ?? _acceleration,
        gearbox: gearbox ?? _gearbox,
        drivetrain: drivetrain ?? _drivetrain,
        co: co ?? _co,
        door: door ?? _door,
        seat: seat ?? _seat,
        insuranceGroup: insuranceGroup ?? _insuranceGroup,
        tax: tax ?? _tax,
        sellerType: sellerType ?? _sellerType,
        color: color ?? _color,
      );
  Make? get make => _make;
  ModelList? get modelList => _modelList;
  Year? get year => _year;
  ModelVariation? get modelVariation => _modelVariation;
  Mileage? get mileage => _mileage;
  BodyType? get bodyType => _bodyType;
  FuelType? get fuelType => _fuelType;
  EngineSize? get engineSize => _engineSize;
  EnginePower? get enginePower => _enginePower;
  FuelConsumption? get fuelConsumption => _fuelConsumption;
  Acceleration? get acceleration => _acceleration;
  Gearbox? get gearbox => _gearbox;
  Drivetrain? get drivetrain => _drivetrain;
  Co? get co => _co;
  Door? get door => _door;
  Seat? get seat => _seat;
  InsuranceGroup? get insuranceGroup => _insuranceGroup;
  Tax? get tax => _tax;
  SellerType? get sellerType => _sellerType;
  Color? get color => _color;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_make != null) {
      map['make'] = _make?.toJson();
    }
    if (_modelList != null) {
      map['modelList'] = _modelList?.toJson();
    }
    if (_year != null) {
      map['year'] = _year?.toJson();
    }
    if (_modelVariation != null) {
      map['modelVariation'] = _modelVariation?.toJson();
    }
    if (_mileage != null) {
      map['mileage'] = _mileage?.toJson();
    }
    if (_bodyType != null) {
      map['bodyType'] = _bodyType?.toJson();
    }
    if (_fuelType != null) {
      map['fuelType'] = _fuelType?.toJson();
    }
    if (_engineSize != null) {
      map['engineSize'] = _engineSize?.toJson();
    }
    if (_enginePower != null) {
      map['enginePower'] = _enginePower?.toJson();
    }
    if (_fuelConsumption != null) {
      map['fuelConsumption'] = _fuelConsumption?.toJson();
    }
    if (_acceleration != null) {
      map['acceleration'] = _acceleration?.toJson();
    }
    if (_gearbox != null) {
      map['gearbox'] = _gearbox?.toJson();
    }
    if (_drivetrain != null) {
      map['drivetrain'] = _drivetrain?.toJson();
    }
    if (_co != null) {
      map['co'] = _co?.toJson();
    }
    if (_door != null) {
      map['door'] = _door?.toJson();
    }
    if (_seat != null) {
      map['seat'] = _seat?.toJson();
    }
    if (_insuranceGroup != null) {
      map['insuranceGroup'] = _insuranceGroup?.toJson();
    }
    if (_tax != null) {
      map['tax'] = _tax?.toJson();
    }
    if (_sellerType != null) {
      map['sellerType'] = _sellerType?.toJson();
    }
    if (_color != null) {
      map['color'] = _color?.toJson();
    }
    return map;
  }
}

class Color {
  Color({
    num? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  Color.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  num? _id;
  String? _name;
  Color copyWith({
    num? id,
    String? name,
  }) =>
      Color(
        id: id ?? _id,
        name: name ?? _name,
      );
  num? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }
}

class SellerType {
  SellerType({
    num? id,
    String? sellerType,
  }) {
    _id = id;
    _sellerType = sellerType;
  }

  SellerType.fromJson(dynamic json) {
    _id = json['id'];
    _sellerType = json['seller_type'];
  }
  num? _id;
  String? _sellerType;
  SellerType copyWith({
    num? id,
    String? sellerType,
  }) =>
      SellerType(
        id: id ?? _id,
        sellerType: sellerType ?? _sellerType,
      );
  num? get id => _id;
  String? get sellerType => _sellerType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['seller_type'] = _sellerType;
    return map;
  }
}

class Tax {
  Tax({
    num? id,
    String? tax,
  }) {
    _id = id;
    _tax = tax;
  }

  Tax.fromJson(dynamic json) {
    _id = json['id'];
    _tax = json['tax'];
  }
  num? _id;
  String? _tax;
  Tax copyWith({
    num? id,
    String? tax,
  }) =>
      Tax(
        id: id ?? _id,
        tax: tax ?? _tax,
      );
  num? get id => _id;
  String? get tax => _tax;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['tax'] = _tax;
    return map;
  }
}

class InsuranceGroup {
  InsuranceGroup({
    num? id,
    String? insuranceGroup,
  }) {
    _id = id;
    _insuranceGroup = insuranceGroup;
  }

  InsuranceGroup.fromJson(dynamic json) {
    _id = json['id'];
    _insuranceGroup = json['insurance_group'];
  }
  num? _id;
  String? _insuranceGroup;
  InsuranceGroup copyWith({
    num? id,
    String? insuranceGroup,
  }) =>
      InsuranceGroup(
        id: id ?? _id,
        insuranceGroup: insuranceGroup ?? _insuranceGroup,
      );
  num? get id => _id;
  String? get insuranceGroup => _insuranceGroup;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['insurance_group'] = _insuranceGroup;
    return map;
  }
}

class Seat {
  Seat({
    num? id,
    String? totalSeats,
  }) {
    _id = id;
    _totalSeats = totalSeats;
  }

  Seat.fromJson(dynamic json) {
    _id = json['id'];
    _totalSeats = json['total_seats'];
  }
  num? _id;
  String? _totalSeats;
  Seat copyWith({
    num? id,
    String? totalSeats,
  }) =>
      Seat(
        id: id ?? _id,
        totalSeats: totalSeats ?? _totalSeats,
      );
  num? get id => _id;
  String? get totalSeats => _totalSeats;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['total_seats'] = _totalSeats;
    return map;
  }
}

class Door {
  Door({
    num? id,
    String? doors,
  }) {
    _id = id;
    _doors = doors;
  }

  Door.fromJson(dynamic json) {
    _id = json['id'];
    _doors = json['doors'];
  }
  num? _id;
  String? _doors;
  Door copyWith({
    num? id,
    String? doors,
  }) =>
      Door(
        id: id ?? _id,
        doors: doors ?? _doors,
      );
  num? get id => _id;
  String? get doors => _doors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['doors'] = _doors;
    return map;
  }
}

class Co {
  Co({
    num? id,
    String? co,
  }) {
    _id = id;
    _co = co;
  }

  Co.fromJson(dynamic json) {
    _id = json['id'];
    _co = json['co'];
  }
  num? _id;
  String? _co;
  Co copyWith({
    num? id,
    String? co,
  }) =>
      Co(
        id: id ?? _id,
        co: co ?? _co,
      );
  num? get id => _id;
  String? get co => _co;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['co'] = _co;
    return map;
  }
}

class Drivetrain {
  Drivetrain({
    num? id,
    String? drivetrain,
  }) {
    _id = id;
    _drivetrain = drivetrain;
  }

  Drivetrain.fromJson(dynamic json) {
    _id = json['id'];
    _drivetrain = json['drivetrain'];
  }
  num? _id;
  String? _drivetrain;
  Drivetrain copyWith({
    num? id,
    String? drivetrain,
  }) =>
      Drivetrain(
        id: id ?? _id,
        drivetrain: drivetrain ?? _drivetrain,
      );
  num? get id => _id;
  String? get drivetrain => _drivetrain;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['drivetrain'] = _drivetrain;
    return map;
  }
}

class Gearbox {
  Gearbox({
    num? id,
    String? gearType,
  }) {
    _id = id;
    _gearType = gearType;
  }

  Gearbox.fromJson(dynamic json) {
    _id = json['id'];
    _gearType = json['gear_type'];
  }
  num? _id;
  String? _gearType;
  Gearbox copyWith({
    num? id,
    String? gearType,
  }) =>
      Gearbox(
        id: id ?? _id,
        gearType: gearType ?? _gearType,
      );
  num? get id => _id;
  String? get gearType => _gearType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['gear_type'] = _gearType;
    return map;
  }
}

class Acceleration {
  Acceleration({
    num? id,
    String? acceleration,
  }) {
    _id = id;
    _acceleration = acceleration;
  }

  Acceleration.fromJson(dynamic json) {
    _id = json['id'];
    _acceleration = json['acceleration'];
  }
  num? _id;
  String? _acceleration;
  Acceleration copyWith({
    num? id,
    String? acceleration,
  }) =>
      Acceleration(
        id: id ?? _id,
        acceleration: acceleration ?? _acceleration,
      );
  num? get id => _id;
  String? get acceleration => _acceleration;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['acceleration'] = _acceleration;
    return map;
  }
}

class FuelConsumption {
  FuelConsumption({
    num? id,
    String? fuelConsume,
  }) {
    _id = id;
    _fuelConsume = fuelConsume;
  }

  FuelConsumption.fromJson(dynamic json) {
    _id = json['id'];
    _fuelConsume = json['fuel_consume'];
  }
  num? _id;
  String? _fuelConsume;
  FuelConsumption copyWith({
    num? id,
    String? fuelConsume,
  }) =>
      FuelConsumption(
        id: id ?? _id,
        fuelConsume: fuelConsume ?? _fuelConsume,
      );
  num? get id => _id;
  String? get fuelConsume => _fuelConsume;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['fuel_consume'] = _fuelConsume;
    return map;
  }
}

class EnginePower {
  EnginePower({
    num? id,
    String? enginePower,
  }) {
    _id = id;
    _enginePower = enginePower;
  }

  EnginePower.fromJson(dynamic json) {
    _id = json['id'];
    _enginePower = json['engine_power'];
  }
  num? _id;
  String? _enginePower;
  EnginePower copyWith({
    num? id,
    String? enginePower,
  }) =>
      EnginePower(
        id: id ?? _id,
        enginePower: enginePower ?? _enginePower,
      );
  num? get id => _id;
  String? get enginePower => _enginePower;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['engine_power'] = _enginePower;
    return map;
  }
}

class EngineSize {
  EngineSize({
    num? id,
    String? engineSize,
  }) {
    _id = id;
    _engineSize = engineSize;
  }

  EngineSize.fromJson(dynamic json) {
    _id = json['id'];
    _engineSize = json['engine_size'];
  }
  num? _id;
  String? _engineSize;
  EngineSize copyWith({
    num? id,
    String? engineSize,
  }) =>
      EngineSize(
        id: id ?? _id,
        engineSize: engineSize ?? _engineSize,
      );
  num? get id => _id;
  String? get engineSize => _engineSize;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['engine_size'] = _engineSize;
    return map;
  }
}

class FuelType {
  FuelType({
    num? id,
    String? fuelType,
  }) {
    _id = id;
    _fuelType = fuelType;
  }

  FuelType.fromJson(dynamic json) {
    _id = json['id'];
    _fuelType = json['fuel_type'];
  }
  num? _id;
  String? _fuelType;
  FuelType copyWith({
    num? id,
    String? fuelType,
  }) =>
      FuelType(
        id: id ?? _id,
        fuelType: fuelType ?? _fuelType,
      );
  num? get id => _id;
  String? get fuelType => _fuelType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['fuel_type'] = _fuelType;
    return map;
  }
}

class BodyType {
  BodyType({
    num? id,
    String? bodyType,
  }) {
    _id = id;
    _bodyType = bodyType;
  }

  BodyType.fromJson(dynamic json) {
    _id = json['id'];
    _bodyType = json['body_type'];
  }
  num? _id;
  String? _bodyType;
  BodyType copyWith({
    num? id,
    String? bodyType,
  }) =>
      BodyType(
        id: id ?? _id,
        bodyType: bodyType ?? _bodyType,
      );
  num? get id => _id;
  String? get bodyType => _bodyType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['body_type'] = _bodyType;
    return map;
  }
}

class Mileage {
  Mileage({
    num? id,
    String? carMileage,
  }) {
    _id = id;
    _carMileage = carMileage;
  }

  Mileage.fromJson(dynamic json) {
    _id = json['id'];
    _carMileage = json['car_mileage'];
  }
  num? _id;
  String? _carMileage;
  Mileage copyWith({
    num? id,
    String? carMileage,
  }) =>
      Mileage(
        id: id ?? _id,
        carMileage: carMileage ?? _carMileage,
      );
  num? get id => _id;
  String? get carMileage => _carMileage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['car_mileage'] = _carMileage;
    return map;
  }
}

class ModelVariation {
  ModelVariation({
    num? id,
    String? variationName,
    String? number,
  }) {
    _id = id;
    _variationName = variationName;
    _number = number;
  }

  ModelVariation.fromJson(dynamic json) {
    _id = json['id'];
    _variationName = json['variation_name'];
    _number = json['number'];
  }
  num? _id;
  String? _variationName;
  String? _number;
  ModelVariation copyWith({
    num? id,
    String? variationName,
    String? number,
  }) =>
      ModelVariation(
        id: id ?? _id,
        variationName: variationName ?? _variationName,
        number: number ?? _number,
      );
  num? get id => _id;
  String? get variationName => _variationName;
  String? get number => _number;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['variation_name'] = _variationName;
    map['number'] = _number;
    return map;
  }
}

class Year {
  Year({
    num? id,
    String? yearName,
  }) {
    _id = id;
    _yearName = yearName;
  }

  Year.fromJson(dynamic json) {
    _id = json['id'];
    _yearName = json['year_name'];
  }
  num? _id;
  String? _yearName;
  Year copyWith({
    num? id,
    String? yearName,
  }) =>
      Year(
        id: id ?? _id,
        yearName: yearName ?? _yearName,
      );
  num? get id => _id;
  String? get yearName => _yearName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['year_name'] = _yearName;
    return map;
  }
}

class Make {
  Make({
    num? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  Make.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  num? _id;
  String? _name;
  Make copyWith({
    num? id,
    String? name,
  }) =>
      Make(
        id: id ?? _id,
        name: name ?? _name,
      );
  num? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }
}

class ModelList {
  ModelList({
    num? id,
    String? model,
  }) {
    _id = id;
    _model = model;
  }

  ModelList.fromJson(dynamic json) {
    _id = json['id'];
    _model = json['model'];
  }
  num? _id;
  String? _model;
  ModelList copyWith({
    num? id,
    String? model,
  }) =>
      ModelList(
        id: id ?? _id,
        model: model ?? _model,
      );
  num? get id => _id;
  String? get model => _model;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['model'] = _model;
    return map;
  }
}
