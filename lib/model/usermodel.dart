class UserModel {
  String? id;
  String? name;
  String? email;

  UserModel({this.email, this.id, this.name});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJsonAdd() {
    return {
      "email": email,
      "name": name,
    };
  }

  Map<String, dynamic> toJsonUpdate() {
    return {
      "id": id,
      "email": email,
      "name": name,
    };
  }
}
