class CarCo2 {
  CarCo2({
    List<Co2>? co2,
    num? status,
    String? message,
  }) {
    _co2 = co2;
    _status = status;
    _message = message;
  }

  CarCo2.fromJson(dynamic json) {
    if (json['Co2'] != null) {
      _co2 = [];
      json['Co2'].forEach((v) {
        _co2?.add(Co2.fromJson(v));
      });
    }
    _status = json['status'];
    _message = json['message'];
  }
  List<Co2>? _co2;
  num? _status;
  String? _message;
  CarCo2 copyWith({
    List<Co2>? co2,
    num? status,
    String? message,
  }) =>
      CarCo2(
        co2: co2 ?? _co2,
        status: status ?? _status,
        message: message ?? _message,
      );
  List<Co2>? get co2 => _co2;
  num? get status => _status;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_co2 != null) {
      map['Co2'] = _co2?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }
}

class Co2 {
  Co2({
    num? id,
    String? co,
  }) {
    _id = id;
    _co = co;
  }

  Co2.fromJson(dynamic json) {
    _id = json['id'];
    _co = json['co'];
  }
  num? _id;
  String? _co;
  Co2 copyWith({
    num? id,
    String? co,
  }) =>
      Co2(
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
