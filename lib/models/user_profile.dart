class UserProfile {
  UserProfile({
    User? user,
    String? token,
  }) {
    _user = user;
    _token = token;
  }

  UserProfile.fromJson(dynamic json) {
    _user = User.fromJson(json['user']);
    _token = json['token'];
  }
  User? _user;
  String? _token;
  UserProfile copyWith({
    User? user,
    String? token,
  }) =>
      UserProfile(
        user: user ?? _user,
        token: token ?? _token,
      );
  User? get user => _user;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['token'] = _token;
    return map;
  }
}

class User {
  User({
    num? id,
    String? fullName,
    String? address,
    String? phoneNumber,
    String? email,
    String? password,
    String? profileImage,
    String? dateOfBirth,
    String? driverLicense,
    String? idCard,
    String? status,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _fullName = fullName;
    _address = address;
    _phoneNumber = phoneNumber;
    _email = email;
    _password = password;
    _profileImage = profileImage;
    _dateOfBirth = dateOfBirth;
    _driverLicense = driverLicense;
    _idCard = idCard;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
    _fullName = json['full_name'];
    _address = json['address'];
    _phoneNumber = json['phone_number'];
    _email = json['email'];
    _password = json['password'];
    _profileImage = json['profile_image'];
    _dateOfBirth = json['date_of_birth'];
    _driverLicense = json['driver_license'];
    _idCard = json['id_card'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _fullName;
  String? _address;
  String? _phoneNumber;
  String? _email;
  String? _password;
  String? _profileImage;
  String? _dateOfBirth;
  String? _driverLicense;
  String? _idCard;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
  User copyWith({
    num? id,
    String? fullName,
    String? address,
    String? phoneNumber,
    String? email,
    String? password,
    String? profileImage,
    String? dateOfBirth,
    String? driverLicense,
    String? idCard,
    String? status,
    String? createdAt,
    String? updatedAt,
  }) =>
      User(
        id: id ?? _id,
        fullName: fullName ?? _fullName,
        address: address ?? _address,
        phoneNumber: phoneNumber ?? _phoneNumber,
        email: email ?? _email,
        password: password ?? _password,
        profileImage: profileImage ?? _profileImage,
        dateOfBirth: dateOfBirth ?? _dateOfBirth,
        driverLicense: driverLicense ?? _driverLicense,
        idCard: idCard ?? _idCard,
        status: status ?? _status,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  num? get id => _id;
  String? get fullName => _fullName;
  String? get address => _address;
  String? get phoneNumber => _phoneNumber;
  String? get email => _email;
  String? get password => _password;
  String? get profileImage => _profileImage;
  String? get dateOfBirth => _dateOfBirth;
  String? get driverLicense => _driverLicense;
  String? get idCard => _idCard;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['full_name'] = _fullName;
    map['address'] = _address;
    map['phone_number'] = _phoneNumber;
    map['email'] = _email;
    map['password'] = _password;
    map['profile_image'] = _profileImage;
    map['date_of_birth'] = _dateOfBirth;
    map['driver_license'] = _driverLicense;
    map['id_card'] = _idCard;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
