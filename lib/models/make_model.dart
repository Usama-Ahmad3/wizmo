class MakeModel {
  MakeModel({
    List<Make>? make,
    num? status,
  }) {
    _make = make;
    _status = status;
  }

  MakeModel.fromJson(dynamic json) {
    if (json['Make'] != null) {
      _make = [];
      json['Make'].forEach((v) {
        _make?.add(Make.fromJson(v));
      });
    }
    _status = json['status'];
  }
  List<Make>? _make;
  num? _status;
  MakeModel copyWith({
    List<Make>? make,
    num? status,
  }) =>
      MakeModel(
        make: make ?? _make,
        status: status ?? _status,
      );
  List<Make>? get make => _make;
  num? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_make != null) {
      map['Make'] = _make?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    return map;
  }
}

class Make {
  Make({
    num? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  Make.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  num? _id;
  String? _name;
  Make copyWith({
    num? id,
    String? name,
  }) =>
      Make(
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
