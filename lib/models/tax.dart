class Tax {
  Tax({
    List<TotalTax>? totalTax,
    num? status,
    String? message,
  }) {
    _totalTax = totalTax;
    _status = status;
    _message = message;
  }

  Tax.fromJson(dynamic json) {
    if (json['Total Tax'] != null) {
      _totalTax = [];
      json['Total Tax'].forEach((v) {
        _totalTax?.add(TotalTax.fromJson(v));
      });
    }
    _status = json['status'];
    _message = json['message'];
  }
  List<TotalTax>? _totalTax;
  num? _status;
  String? _message;
  Tax copyWith({
    List<TotalTax>? totalTax,
    num? status,
    String? message,
  }) =>
      Tax(
        totalTax: totalTax ?? _totalTax,
        status: status ?? _status,
        message: message ?? _message,
      );
  List<TotalTax>? get totalTax => _totalTax;
  num? get status => _status;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_totalTax != null) {
      map['Total Tax'] = _totalTax?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }
}

class TotalTax {
  TotalTax({
    num? id,
    String? tax,
  }) {
    _id = id;
    _tax = tax;
  }

  TotalTax.fromJson(dynamic json) {
    _id = json['id'];
    _tax = json['tax'];
  }
  num? _id;
  String? _tax;
  TotalTax copyWith({
    num? id,
    String? tax,
  }) =>
      TotalTax(
        id: id ?? _id,
        tax: tax ?? _tax,
      );
  num? get id => _id;
  String? get tax => _tax;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['tax'] = _tax;
    return map;
  }
}
