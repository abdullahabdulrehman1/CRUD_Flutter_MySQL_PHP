// import 'dart:convert';

import 'dart:convert';

// import 'package:flutter/material.dart';
import 'package:mysqlcrudapp/model/usermodel.dart';
import 'package:http/http.dart' as http;

class UserService {
  static final  addUrl = Uri.parse("http://192.168.1.33/students_api/add.php" ); // Replace with the actual URL
  static final  viewUrl = Uri.parse("http://192.168.1.33/students_api/view.php" ); // Replace with the actual URL
  static final  updateUrl = Uri.parse("http://192.168.1.33/students_api/update.php" ); // Replace with the actual URL
  // static final  = "http://192.168.1.33/students_api/view.php"; // Replace with the actual URL
  
  Future<String> addUser(UserModel usermodel) async {
    final response = await http.post(addUrl, body: usermodel.toJsonAdd());
    if (response.statusCode == 200) {
      print(response.body);
      return response.body;
    } else {
      return "ERROR";
    }
  }
  
  List<UserModel> userFromJson(String jsonString) {
  final data = json.decode(jsonString) ;
  return List <UserModel>.from(data.map((item) => UserModel.fromJson(item)));
}
Future<List<UserModel>> getUser() async {
  try {
    final response = await http.get((viewUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return List<UserModel>.from(data.map((item) => UserModel.fromJson(item)));
    } else {
      throw Exception('Failed to fetch user data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching user data: $e');
    throw Exception('Failed to fetch user data: $e');
  }
}
 Future<String> updateUser(UserModel usermodel) async {
    final response = await http.post(updateUrl, body: usermodel.toJsonUpdate());
    if (response.statusCode == 200) {
      print(response.body);
      return response.body;
    } else {
      return "ERROR";
    }
  }


}