class CarAcceleration {
  CarAcceleration({
    List<Acceleration>? acceleration,
    num? status,
    String? message,
  }) {
    _acceleration = acceleration;
    _status = status;
    _message = message;
  }

  CarAcceleration.fromJson(dynamic json) {
    if (json['Acceleration'] != null) {
      _acceleration = [];
      json['Acceleration'].forEach((v) {
        _acceleration?.add(Acceleration.fromJson(v));
      });
    }
    _status = json['status'];
    _message = json['message'];
  }
  List<Acceleration>? _acceleration;
  num? _status;
  String? _message;
  CarAcceleration copyWith({
    List<Acceleration>? acceleration,
    num? status,
    String? message,
  }) =>
      CarAcceleration(
        acceleration: acceleration ?? _acceleration,
        status: status ?? _status,
        message: message ?? _message,
      );
  List<Acceleration>? get acceleration => _acceleration;
  num? get status => _status;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_acceleration != null) {
      map['Acceleration'] = _acceleration?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    map['message'] = _message;
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
