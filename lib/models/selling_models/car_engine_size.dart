class CarEngineSize {
  CarEngineSize({
    List<EngineSize>? engineSize,
    num? status,
  }) {
    _EngineSize = engineSize;
    _status = status;
  }

  CarEngineSize.fromJson(dynamic json) {
    if (json[' Engine Size'] != null) {
      _EngineSize = [];
      json[' Engine Size'].forEach((v) {
        _EngineSize?.add(EngineSize.fromJson(v));
      });
    }
    _status = json['status'];
  }
  List<EngineSize>? _EngineSize;
  num? _status;
  CarEngineSize copyWith({
    List<EngineSize>? engineSize,
    num? status,
  }) =>
      CarEngineSize(
        engineSize: engineSize ?? _EngineSize,
        status: status ?? _status,
      );
  List<EngineSize>? get engineSize => _EngineSize;
  num? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_EngineSize != null) {
      map[' Engine Size'] = _EngineSize?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
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
