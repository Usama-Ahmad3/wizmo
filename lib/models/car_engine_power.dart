class CarEnginePower {
  CarEnginePower({
    List<EnginePower>? enginePower,
    num? status,
    String? message,
  }) {
    _EnginePower = enginePower;
    _status = status;
    _message = message;
  }

  CarEnginePower.fromJson(dynamic json) {
    if (json[' Engine Power'] != null) {
      _EnginePower = [];
      json[' Engine Power'].forEach((v) {
        _EnginePower?.add(EnginePower.fromJson(v));
      });
    }
    _status = json['status'];
    _message = json['message'];
  }
  List<EnginePower>? _EnginePower;
  num? _status;
  String? _message;
  CarEnginePower copyWith({
    List<EnginePower>? enginePower,
    num? status,
    String? message,
  }) =>
      CarEnginePower(
        enginePower: enginePower ?? _EnginePower,
        status: status ?? _status,
        message: message ?? _message,
      );
  List<EnginePower>? get enginePower => _EnginePower;
  num? get status => _status;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_EnginePower != null) {
      map[' Engine Power'] = _EnginePower?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    map['message'] = _message;
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
