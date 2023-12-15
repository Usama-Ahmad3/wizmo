class CarYear {
  CarYear({
    List<Year>? year,
    num? status,
  }) {
    _year = year;
    _status = status;
  }

  CarYear.fromJson(dynamic json) {
    if (json['Year'] != null) {
      _year = [];
      json['Year'].forEach((v) {
        _year?.add(Year.fromJson(v));
      });
    }
    _status = json['status'];
  }
  List<Year>? _year;
  num? _status;
  CarYear copyWith({
    List<Year>? year,
    num? status,
  }) =>
      CarYear(
        year: year ?? _year,
        status: status ?? _status,
      );
  List<Year>? get year => _year;
  num? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_year != null) {
      map['Year'] = _year?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    return map;
  }
}

class Year {
  Year({
    num? id,
    String? yearName,
  }) {
    _id = id;
    _yearName = yearName;
  }

  Year.fromJson(dynamic json) {
    _id = json['id'];
    _yearName = json['year_name'];
  }
  num? _id;
  String? _yearName;
  Year copyWith({
    num? id,
    String? yearName,
  }) =>
      Year(
        id: id ?? _id,
        yearName: yearName ?? _yearName,
      );
  num? get id => _id;
  String? get yearName => _yearName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['year_name'] = _yearName;
    return map;
  }
}
