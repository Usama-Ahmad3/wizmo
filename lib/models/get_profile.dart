class GetProfile {
  GetProfile({
    List<UserProfil>? userProfile,
  }) {
    _userProfile = userProfile;
  }

  GetProfile.fromJson(dynamic json) {
    if (json['user_profile'] != null) {
      _userProfile = [];
      json['user_profile'].forEach((v) {
        _userProfile?.add(UserProfil.fromJson(v));
      });
    }
  }
  List<UserProfil>? _userProfile;
  GetProfile copyWith({
    List<UserProfil>? userProfile,
  }) =>
      GetProfile(
        userProfile: userProfile ?? _userProfile,
      );
  List<UserProfil>? get userProfile => _userProfile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_userProfile != null) {
      map['user_profile'] = _userProfile?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class UserProfil {
  UserProfil({
    num? id,
    String? name,
    String? email,
    String? address,
    String? phoneNumber,
    String? dateOfBirth,
    String? profileImage,
  }) {
    _id = id;
    _name = name;
    _email = email;
    _address = address;
    _phoneNumber = phoneNumber;
    _dateOfBirth = dateOfBirth;
    _profileImage = profileImage;
  }

  UserProfil.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _address = json['address'];
    _phoneNumber = json['phone_number'];
    _dateOfBirth = json['date_of_birth'];
    _profileImage = json['profile_image'];
  }
  num? _id;
  String? _name;
  String? _email;
  String? _address;
  String? _phoneNumber;
  String? _dateOfBirth;
  String? _profileImage;
  UserProfil copyWith({
    num? id,
    String? name,
    String? email,
    String? address,
    String? phoneNumber,
    String? dateOfBirth,
    String? profileImage,
  }) =>
      UserProfil(
        id: id ?? _id,
        name: name ?? _name,
        email: email ?? _email,
        address: address ?? _address,
        phoneNumber: phoneNumber ?? _phoneNumber,
        dateOfBirth: dateOfBirth ?? _dateOfBirth,
        profileImage: profileImage ?? _profileImage,
      );
  num? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get address => _address;
  String? get phoneNumber => _phoneNumber;
  String? get dateOfBirth => _dateOfBirth;
  String? get profileImage => _profileImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['address'] = _address;
    map['phone_number'] = _phoneNumber;
    map['date_of_birth'] = _dateOfBirth;
    map['profile_image'] = _profileImage;
    return map;
  }
}
