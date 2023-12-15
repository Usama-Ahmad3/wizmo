class BodyTypee {
  BodyTypee({
      List<BodyType>? bodyType, 
      num? status,}){
    _bodyType = bodyType;
    _status = status;
}

  BodyTypee.fromJson(dynamic json) {
    if (json['Body Type'] != null) {
      _bodyType = [];
      json['Body Type'].forEach((v) {
        _bodyType?.add(BodyType.fromJson(v));
      });
    }
    _status = json['status'];
  }
  List<BodyType>? _bodyType;
  num? _status;
BodyTypee copyWith({  List<BodyType>? bodyType,
  num? status,
}) => BodyTypee(  bodyType: bodyType ?? _bodyType,
  status: status ?? _status,
);
  List<BodyType>? get bodyType => _bodyType;
  num? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_bodyType != null) {
      map['Body Type'] = _bodyType?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    return map;
  }

}

class BodyType {
  BodyType({
      num? id, 
      String? bodyType,}){
    _id = id;
    _bodyType = bodyType;
}

  BodyType.fromJson(dynamic json) {
    _id = json['id'];
    _bodyType = json['body_type'];
  }
  num? _id;
  String? _bodyType;
BodyType copyWith({  num? id,
  String? bodyType,
}) => BodyType(  id: id ?? _id,
  bodyType: bodyType ?? _bodyType,
);
  num? get id => _id;
  String? get bodyType => _bodyType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['body_type'] = _bodyType;
    return map;
  }

}