class Insurance {
  Insurance({
    List<InsuranceGroup>? insuranceGroup,
    num? status,
    String? message,
  }) {
    _insuranceGroup = insuranceGroup;
    _status = status;
    _message = message;
  }

  Insurance.fromJson(dynamic json) {
    if (json['Insurance Group'] != null) {
      _insuranceGroup = [];
      json['Insurance Group'].forEach((v) {
        _insuranceGroup?.add(InsuranceGroup.fromJson(v));
      });
    }
    _status = json['status'];
    _message = json['message'];
  }
  List<InsuranceGroup>? _insuranceGroup;
  num? _status;
  String? _message;
  Insurance copyWith({
    List<InsuranceGroup>? insuranceGroup,
    num? status,
    String? message,
  }) =>
      Insurance(
        insuranceGroup: insuranceGroup ?? _insuranceGroup,
        status: status ?? _status,
        message: message ?? _message,
      );
  List<InsuranceGroup>? get insuranceGroup => _insuranceGroup;
  num? get status => _status;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_insuranceGroup != null) {
      map['Insurance Group'] = _insuranceGroup?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }
}

class InsuranceGroup {
  InsuranceGroup({
    num? id,
    String? insuranceGroup,
  }) {
    _id = id;
    _insuranceGroup = insuranceGroup;
  }

  InsuranceGroup.fromJson(dynamic json) {
    _id = json['id'];
    _insuranceGroup = json['insurance_group'];
  }
  num? _id;
  String? _insuranceGroup;
  InsuranceGroup copyWith({
    num? id,
    String? insuranceGroup,
  }) =>
      InsuranceGroup(
        id: id ?? _id,
        insuranceGroup: insuranceGroup ?? _insuranceGroup,
      );
  num? get id => _id;
  String? get insuranceGroup => _insuranceGroup;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['insurance_group'] = _insuranceGroup;
    return map;
  }
}
