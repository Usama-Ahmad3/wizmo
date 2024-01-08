class TypeSeller {
  TypeSeller({
    List<SellerType>? sellerType,
    num? status,
    String? message,
  }) {
    _sellerType = sellerType;
    _status = status;
    _message = message;
  }

  TypeSeller.fromJson(dynamic json) {
    if (json['Seller Type'] != null) {
      _sellerType = [];
      json['Seller Type'].forEach((v) {
        _sellerType?.add(SellerType.fromJson(v));
      });
    }
    _status = json['status'];
    _message = json['message'];
  }
  List<SellerType>? _sellerType;
  num? _status;
  String? _message;
  TypeSeller copyWith({
    List<SellerType>? sellerType,
    num? status,
    String? message,
  }) =>
      TypeSeller(
        sellerType: sellerType ?? _sellerType,
        status: status ?? _status,
        message: message ?? _message,
      );
  List<SellerType>? get sellerType => _sellerType;
  num? get status => _status;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_sellerType != null) {
      map['Seller Type'] = _sellerType?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }
}

class SellerType {
  SellerType({
    num? id,
    String? sellerType,
  }) {
    _id = id;
    _sellerType = sellerType;
  }

  SellerType.fromJson(dynamic json) {
    _id = json['id'];
    _sellerType = json['seller_type'];
  }
  num? _id;
  String? _sellerType;
  SellerType copyWith({
    num? id,
    String? sellerType,
  }) =>
      SellerType(
        id: id ?? _id,
        sellerType: sellerType ?? _sellerType,
      );
  num? get id => _id;
  String? get sellerType => _sellerType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['seller_type'] = _sellerType;
    return map;
  }
}
