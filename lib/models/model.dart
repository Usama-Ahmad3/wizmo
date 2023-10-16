class UserJson {
  final int id;
  final String name;
  final String email;
  final String userName;
  final String website;
  final String phone;

  UserJson(
      {required this.id,
      required this.name,
      required this.email,
      required this.userName,
      required this.website,
      required this.phone});
  factory UserJson.fromJson(json) => UserJson(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        userName: json['username'],
        website: json['website'],
        phone: json['phone'],
      );
}
