class CarFuelConsumption {
  CarFuelConsumption({
    List<FuelConsumption>? fuelConsumption,
    num? status,
    String? message,
  }) {
    _FuelConsumption = fuelConsumption;
    _status = status;
    _message = message;
  }

  CarFuelConsumption.fromJson(dynamic json) {
    if (json[' Fuel Consumption'] != null) {
      _FuelConsumption = [];
      json[' Fuel Consumption'].forEach((v) {
        _FuelConsumption?.add(FuelConsumption.fromJson(v));
      });
    }
    _status = json['status'];
    _message = json['message'];
  }
  List<FuelConsumption>? _FuelConsumption;
  num? _status;
  String? _message;
  CarFuelConsumption copyWith({
    List<FuelConsumption>? fuelConsumption,
    num? status,
    String? message,
  }) =>
      CarFuelConsumption(
        fuelConsumption: fuelConsumption ?? _FuelConsumption,
        status: status ?? _status,
        message: message ?? _message,
      );
  List<FuelConsumption>? get fuelConsumption => _FuelConsumption;
  num? get status => _status;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_FuelConsumption != null) {
      map[' Fuel Consumption'] =
          _FuelConsumption?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    map['message'] = _message;
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
