class Seats {
  Seats({
    List<TotalSeats>? totalSeats,
    num? status,
    String? message,
  }) {
    _totalSeats = totalSeats;
    _status = status;
    _message = message;
  }

  Seats.fromJson(dynamic json) {
    if (json['Total Seats'] != null) {
      _totalSeats = [];
      json['Total Seats'].forEach((v) {
        _totalSeats?.add(TotalSeats.fromJson(v));
      });
    }
    _status = json['status'];
    _message = json['message'];
  }
  List<TotalSeats>? _totalSeats;
  num? _status;
  String? _message;
  Seats copyWith({
    List<TotalSeats>? totalSeats,
    num? status,
    String? message,
  }) =>
      Seats(
        totalSeats: totalSeats ?? _totalSeats,
        status: status ?? _status,
        message: message ?? _message,
      );
  List<TotalSeats>? get totalSeats => _totalSeats;
  num? get status => _status;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_totalSeats != null) {
      map['Total Seats'] = _totalSeats?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }
}

class TotalSeats {
  TotalSeats({
    num? id,
    String? totalSeats,
  }) {
    _id = id;
    _totalSeats = totalSeats;
  }

  TotalSeats.fromJson(dynamic json) {
    _id = json['id'];
    _totalSeats = json['total_seats'];
  }
  num? _id;
  String? _totalSeats;
  TotalSeats copyWith({
    num? id,
    String? totalSeats,
  }) =>
      TotalSeats(
        id: id ?? _id,
        totalSeats: totalSeats ?? _totalSeats,
      );
  num? get id => _id;
  String? get totalSeats => _totalSeats;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['total_seats'] = _totalSeats;
    return map;
  }
}
