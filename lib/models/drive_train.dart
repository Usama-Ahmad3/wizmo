class DriveTrain {
  DriveTrain({
    List<Drivetrain>? drivetrain,
    num? status,
    String? message,
  }) {
    _drivetrain = drivetrain;
    _status = status;
    _message = message;
  }

  DriveTrain.fromJson(dynamic json) {
    if (json['drivetrain'] != null) {
      _drivetrain = [];
      json['drivetrain'].forEach((v) {
        _drivetrain?.add(Drivetrain.fromJson(v));
      });
    }
    _status = json['status'];
    _message = json['message'];
  }
  List<Drivetrain>? _drivetrain;
  num? _status;
  String? _message;
  DriveTrain copyWith({
    List<Drivetrain>? drivetrain,
    num? status,
    String? message,
  }) =>
      DriveTrain(
        drivetrain: drivetrain ?? _drivetrain,
        status: status ?? _status,
        message: message ?? _message,
      );
  List<Drivetrain>? get drivetrain => _drivetrain;
  num? get status => _status;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_drivetrain != null) {
      map['drivetrain'] = _drivetrain?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }
}

class Drivetrain {
  Drivetrain({
    num? id,
    String? drivetrain,
  }) {
    _id = id;
    _drivetrain = drivetrain;
  }

  Drivetrain.fromJson(dynamic json) {
    _id = json['id'];
    _drivetrain = json['drivetrain'];
  }
  num? _id;
  String? _drivetrain;
  Drivetrain copyWith({
    num? id,
    String? drivetrain,
  }) =>
      Drivetrain(
        id: id ?? _id,
        drivetrain: drivetrain ?? _drivetrain,
      );
  num? get id => _id;
  String? get drivetrain => _drivetrain;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['drivetrain'] = _drivetrain;
    return map;
  }
}
