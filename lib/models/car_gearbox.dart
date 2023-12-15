class CarGearbox {
  CarGearbox({
    List<Gearbox>? gearbox,
    num? status,
    String? message,
  }) {
    _gearbox = gearbox;
    _status = status;
    _message = message;
  }

  CarGearbox.fromJson(dynamic json) {
    if (json['Gearbox'] != null) {
      _gearbox = [];
      json['Gearbox'].forEach((v) {
        _gearbox?.add(Gearbox.fromJson(v));
      });
    }
    _status = json['status'];
    _message = json['message'];
  }
  List<Gearbox>? _gearbox;
  num? _status;
  String? _message;
  CarGearbox copyWith({
    List<Gearbox>? gearbox,
    num? status,
    String? message,
  }) =>
      CarGearbox(
        gearbox: gearbox ?? _gearbox,
        status: status ?? _status,
        message: message ?? _message,
      );
  List<Gearbox>? get gearbox => _gearbox;
  num? get status => _status;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_gearbox != null) {
      map['Gearbox'] = _gearbox?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    map['message'] = _message;
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
