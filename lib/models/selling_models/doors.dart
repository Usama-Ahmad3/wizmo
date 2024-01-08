class Doors {
  Doors({
    List<TotalDoors>? totalDoors,
    num? status,
    String? message,
  }) {
    _totalDoors = totalDoors;
    _status = status;
    _message = message;
  }

  Doors.fromJson(dynamic json) {
    if (json['Total Doors'] != null) {
      _totalDoors = [];
      json['Total Doors'].forEach((v) {
        _totalDoors?.add(TotalDoors.fromJson(v));
      });
    }
    _status = json['status'];
    _message = json['message'];
  }
  List<TotalDoors>? _totalDoors;
  num? _status;
  String? _message;
  Doors copyWith({
    List<TotalDoors>? totalDoors,
    num? status,
    String? message,
  }) =>
      Doors(
        totalDoors: totalDoors ?? _totalDoors,
        status: status ?? _status,
        message: message ?? _message,
      );
  List<TotalDoors>? get totalDoors => _totalDoors;
  num? get status => _status;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_totalDoors != null) {
      map['Total Doors'] = _totalDoors?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }
}

class TotalDoors {
  TotalDoors({
    num? id,
    String? doors,
  }) {
    _id = id;
    _doors = doors;
  }

  TotalDoors.fromJson(dynamic json) {
    _id = json['id'];
    _doors = json['doors'];
  }
  num? _id;
  String? _doors;
  TotalDoors copyWith({
    num? id,
    String? doors,
  }) =>
      TotalDoors(
        id: id ?? _id,
        doors: doors ?? _doors,
      );
  num? get id => _id;
  String? get doors => _doors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['doors'] = _doors;
    return map;
  }
}
