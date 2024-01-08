class TypeFuel {
  TypeFuel({
    List<FuelType>? fuelType,
    num? status,
  }) {
    _fuelType = fuelType;
    _status = status;
  }

  TypeFuel.fromJson(dynamic json) {
    if (json['Fuel Type'] != null) {
      _fuelType = [];
      json['Fuel Type'].forEach((v) {
        _fuelType?.add(FuelType.fromJson(v));
      });
    }
    _status = json['status'];
  }
  List<FuelType>? _fuelType;
  num? _status;
  TypeFuel copyWith({
    List<FuelType>? fuelType,
    num? status,
  }) =>
      TypeFuel(
        fuelType: fuelType ?? _fuelType,
        status: status ?? _status,
      );
  List<FuelType>? get fuelType => _fuelType;
  num? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_fuelType != null) {
      map['Fuel Type'] = _fuelType?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
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
