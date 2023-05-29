// import 'dart:convert';

import 'dart:convert';

import 'package:mysqlcrudapp/model/usermodel.dart';
import 'package:http/http.dart' as http;

class UserService {
  static const addUrl = "http://192.168.1.33/students_api/add.php"; // Replace with the actual URL
  static const viewUrl = "http://192.168.1.33/students_api/view.php"; // Replace with the actual URL
  
  Future<String> addUser(UserModel usermodel) async {
    final response = await http.post(Uri.parse(addUrl), body: usermodel.toJsonAdd());
    if (response.statusCode == 200) {
      print(response.body);
      return response.body;
    } else {
      return "ERROR";
    }
  }
  
  List<UserModel> userFromJson(String jsonString) {
  final data = json.decode(jsonString) as List<dynamic>;
  return data.map((item) => UserModel.fromJson(item)).toList();
}

  Future <List<UserModel>> getUser()async{
    final response = await http.get(Uri.parse(viewUrl));
  if(response.statusCode ==200){
    List<UserModel> list = userFromJson(response.body);
    return list;  
  }
  else{
return    List<UserModel>.empty();
  }
  }
}
