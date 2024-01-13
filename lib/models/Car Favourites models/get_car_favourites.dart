class GetCarFavourites {
  int? status;
  List<Cars>? cars;

  GetCarFavourites({this.status, this.cars});

  GetCarFavourites.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    if (json['Cars'] != null) {
      cars = <Cars>[];
      json['Cars'].forEach((v) {
        cars!.add(Cars.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Status'] = status;
    if (cars != null) {
      data['Cars'] = cars!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cars {
  int? id;
  int? carId;
  int? userId;
  Car? car;

  Cars({this.id, this.carId, this.userId, this.car});

  Cars.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    carId = json['car_id'];
    userId = json['user_id'];
    car = json['car'] != null ? Car.fromJson(json['car']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['car_id'] = carId;
    data['user_id'] = userId;
    if (car != null) {
      data['car'] = car!.toJson();
    }
    return data;
  }
}

class Car {
  int? id;
  String? role;
  String? rgistraion;
  String? sellertype;
  String? carName;
  String? model;
  String? description;
  String? location;
  String? price;
  String? make;
  String? longitude;
  String? latitude;
  String? userName;
  String? userEmail;
  String? userPhoneNumber;
  String? userAddress;
  List<String>? carImages;
  List<String>? features;

  Car(
      {this.id,
      this.role,
      this.rgistraion,
      this.sellertype,
      this.carName,
      this.model,
      this.description,
      this.location,
      this.price,
      this.make,
      this.longitude,
      this.latitude,
      this.userName,
      this.userEmail,
      this.userPhoneNumber,
      this.userAddress,
      this.carImages,
      this.features});

  Car.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
    rgistraion = json['rgistraion'];
    sellertype = json['sellertype'];
    carName = json['car_name'];
    model = json['model'];
    description = json['description'];
    location = json['location'];
    price = json['price'];
    make = json['make'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userPhoneNumber = json['user_phone_number'];
    userAddress = json['user_address'];
    carImages = json['car_images'].cast<String>();
    features = json['features'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['role'] = role;
    data['rgistraion'] = rgistraion;
    data['sellertype'] = sellertype;
    data['car_name'] = carName;
    data['model'] = model;
    data['description'] = description;
    data['location'] = location;
    data['price'] = price;
    data['make'] = make;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['user_name'] = userName;
    data['user_email'] = userEmail;
    data['user_phone_number'] = userPhoneNumber;
    data['user_address'] = userAddress;
    data['car_images'] = carImages;
    data['features'] = features;
    return data;
  }
}