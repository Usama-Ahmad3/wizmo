class PostCarFavourites {
  String? message;
  int? status;

  PostCarFavourites({this.message, this.status});

  PostCarFavourites.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}