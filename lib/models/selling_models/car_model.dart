class CarModel {
  CarModel({
    List<Model>? model,
    num? status,
  }) {
    _model = model;
    _status = status;
  }

  CarModel.fromJson(dynamic json) {
    if (json['Model'] != null) {
      _model = [];
      json['Model'].forEach((v) {
        _model?.add(Model.fromJson(v));
      });
    }
    _status = json['status'];
  }
  List<Model>? _model;
  num? _status;
  CarModel copyWith({
    List<Model>? model,
    num? status,
  }) =>
      CarModel(
        model: model ?? _model,
        status: status ?? _status,
      );
  List<Model>? get model => _model;
  num? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_model != null) {
      map['Model'] = _model?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    return map;
  }
}

class Model {
  Model({
    num? id,
    String? model,
  }) {
    _id = id;
    _model = model;
  }

  Model.fromJson(dynamic json) {
    _id = json['id'];
    _model = json['model'];
  }
  num? _id;
  String? _model;
  Model copyWith({
    num? id,
    String? model,
  }) =>
      Model(
        id: id ?? _id,
        model: model ?? _model,
      );
  num? get id => _id;
  String? get model => _model;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['model'] = _model;
    return map;
  }
}
