class CarColor {
  CarColor({
    num? status,
    String? message,
    List<Color>? color,
  }) {
    _status = status;
    _message = message;
    _color = color;
  }

  CarColor.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['Color'] != null) {
      _color = [];
      json['Color'].forEach((v) {
        _color?.add(Color.fromJson(v));
      });
    }
  }
  num? _status;
  String? _message;
  List<Color>? _color;
  CarColor copyWith({
    num? status,
    String? message,
    List<Color>? color,
  }) =>
      CarColor(
        status: status ?? _status,
        message: message ?? _message,
        color: color ?? _color,
      );
  num? get status => _status;
  String? get message => _message;
  List<Color>? get color => _color;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_color != null) {
      map['Color'] = _color?.map((v) => v.toJson()).toList();
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
