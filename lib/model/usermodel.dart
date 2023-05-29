// import 'package:flutter/foundation.dart';

class UserModel {
  String? id;
  String? name;
  String? email;
  UserModel({this.email, this.id, this.name});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(email: json['email'] as String, id: json['id'] , name: json['name'] as String);
  }
  Map<String,dynamic>toJsonAdd(){
    return{
      "id": id ,
      "email": email ,
      "name":name ,
    };
  }
}
