class Mileage {
  Mileage({
    List<CarMileage>? carMileage,
    num? status,
  }) {
    _carMileage = carMileage;
    _status = status;
  }

  Mileage.fromJson(dynamic json) {
    if (json['car_mileage'] != null) {
      _carMileage = [];
      json['car_mileage'].forEach((v) {
        _carMileage?.add(CarMileage.fromJson(v));
      });
    }
    _status = json['status'];
  }
  List<CarMileage>? _carMileage;
  num? _status;
  Mileage copyWith({
    List<CarMileage>? carMileage,
    num? status,
  }) =>
      Mileage(
        carMileage: carMileage ?? _carMileage,
        status: status ?? _status,
      );
  List<CarMileage>? get carMileage => _carMileage;
  num? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_carMileage != null) {
      map['car_mileage'] = _carMileage?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    return map;
  }
}

class CarMileage {
  CarMileage({
    num? id,
    String? carMileage,
  }) {
    _id = id;
    _carMileage = carMileage;
  }

  CarMileage.fromJson(dynamic json) {
    _id = json['id'];
    _carMileage = json['car_mileage'];
  }
  num? _id;
  String? _carMileage;
  CarMileage copyWith({
    num? id,
    String? carMileage,
  }) =>
      CarMileage(
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
