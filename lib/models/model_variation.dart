class ModelVariation {
  ModelVariation({
    List<ModelVarition>? modelVarition,
    num? status,
  }) {
    _modelVarition = modelVarition;
    _status = status;
  }

  ModelVariation.fromJson(dynamic json) {
    if (json['Model Varition'] != null) {
      _modelVarition = [];
      json['Model Varition'].forEach((v) {
        _modelVarition?.add(ModelVarition.fromJson(v));
      });
    }
    _status = json['status'];
  }
  List<ModelVarition>? _modelVarition;
  num? _status;
  ModelVariation copyWith({
    List<ModelVarition>? modelVarition,
    num? status,
  }) =>
      ModelVariation(
        modelVarition: modelVarition ?? _modelVarition,
        status: status ?? _status,
      );
  List<ModelVarition>? get modelVarition => _modelVarition;
  num? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_modelVarition != null) {
      map['Model Varition'] = _modelVarition?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    return map;
  }
}

class ModelVarition {
  ModelVarition({
    num? id,
    String? variationName,
    String? number,
  }) {
    _id = id;
    _variationName = variationName;
    _number = number;
  }

  ModelVarition.fromJson(dynamic json) {
    _id = json['id'];
    _variationName = json['variation_name'];
    _number = json['number'];
  }
  num? _id;
  String? _variationName;
  String? _number;
  ModelVarition copyWith({
    num? id,
    String? variationName,
    String? number,
  }) =>
      ModelVarition(
        id: id ?? _id,
        variationName: variationName ?? _variationName,
        number: number ?? _number,
      );
  num? get id => _id;
  String? get variationName => _variationName;
  String? get number => _number;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['variation_name'] = _variationName;
    map['number'] = _number;
    return map;
  }
}
