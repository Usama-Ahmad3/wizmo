class SignupModel {
  SignupModel({
    String? message,
    User? user,
    String? token,
  }) {
    _message = message;
    _user = user;
    _token = token;
  }

  SignupModel.fromJson(dynamic json) {
    _message = json['message'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _token = json['token'];
  }
  String? _message;
  User? _user;
  String? _token;
  SignupModel copyWith({
    String? message,
    User? user,
    String? token,
  }) =>
      SignupModel(
        message: message ?? _message,
        user: user ?? _user,
        token: token ?? _token,
      );
  String? get message => _message;
  User? get user => _user;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['token'] = _token;
    return map;
  }
}

class User {
  User({
    String? fullName,
    String? email,
    String? password,
    String? address,
    String? phoneNumber,
    String? dateOfBirth,
    String? driverLicense,
    String? idCard,
    String? profileImage,
    String? updatedAt,
    String? createdAt,
    num? id,
  }) {
    _fullName = fullName;
    _email = email;
    _password = password;
    _address = address;
    _phoneNumber = phoneNumber;
    _dateOfBirth = dateOfBirth;
    _driverLicense = driverLicense;
    _idCard = idCard;
    _profileImage = profileImage;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
  }

  User.fromJson(dynamic json) {
    _fullName = json['full_name'];
    _email = json['email'];
    _password = json['password'];
    _address = json['address'];
    _phoneNumber = json['phone_number'];
    _dateOfBirth = json['date_of_birth'];
    _driverLicense = json['driver_license'];
    _idCard = json['id_card'];
    _profileImage = json['profile_image'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }
  String? _fullName;
  String? _email;
  String? _password;
  String? _address;
  String? _phoneNumber;
  String? _dateOfBirth;
  String? _driverLicense;
  String? _idCard;
  String? _profileImage;
  String? _updatedAt;
  String? _createdAt;
  num? _id;
  User copyWith({
    String? fullName,
    String? email,
    String? password,
    String? address,
    String? phoneNumber,
    String? dateOfBirth,
    String? driverLicense,
    String? idCard,
    String? profileImage,
    String? updatedAt,
    String? createdAt,
    num? id,
  }) =>
      User(
        fullName: fullName ?? _fullName,
        email: email ?? _email,
        password: password ?? _password,
        address: address ?? _address,
        phoneNumber: phoneNumber ?? _phoneNumber,
        dateOfBirth: dateOfBirth ?? _dateOfBirth,
        driverLicense: driverLicense ?? _driverLicense,
        idCard: idCard ?? _idCard,
        profileImage: profileImage ?? _profileImage,
        updatedAt: updatedAt ?? _updatedAt,
        createdAt: createdAt ?? _createdAt,
        id: id ?? _id,
      );
  String? get fullName => _fullName;
  String? get email => _email;
  String? get password => _password;
  String? get address => _address;
  String? get phoneNumber => _phoneNumber;
  String? get dateOfBirth => _dateOfBirth;
  String? get driverLicense => _driverLicense;
  String? get idCard => _idCard;
  String? get profileImage => _profileImage;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  num? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['full_name'] = _fullName;
    map['email'] = _email;
    map['password'] = _password;
    map['address'] = _address;
    map['phone_number'] = _phoneNumber;
    map['date_of_birth'] = _dateOfBirth;
    map['driver_license'] = _driverLicense;
    map['id_card'] = _idCard;
    map['profile_image'] = _profileImage;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }
}
