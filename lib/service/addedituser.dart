import 'package:flutter/material.dart';
import 'package:mysqlcrudapp/model/usermodel.dart';
import 'package:mysqlcrudapp/service/userservice.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddEditUser extends StatefulWidget {
  const AddEditUser({Key? key}) : super(key: key);
  @override
  State<AddEditUser> createState() => _AddEditUserState();
}

class _AddEditUserState extends State<AddEditUser> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  // TextEditingController id = TextEditingController();

  void add(UserModel userModel) async {
    await UserService().addUser(userModel).then(
      (success) => Fluttertoast.showToast(
        msg: "This Field is successful",
        gravity: ToastGravity.CENTER,
        toastLength: Toast.LENGTH_SHORT,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add"),
      ),
      body: Column(
        children: <Widget>[
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: name,
              decoration: const InputDecoration(hintText: 'Enter Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: email,
              decoration: const InputDecoration(hintText: 'Enter Email'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                if (name.text.isEmpty) {
                  Fluttertoast.showToast(
                    msg: "This Field is required",
                    gravity: ToastGravity.CENTER,
                    toastLength: Toast.LENGTH_SHORT,
                  );
                } else {
                  UserModel userModel = UserModel(name: name.text, email: email.text);
                  add(userModel);
                  Fluttertoast.showToast(
                    msg: "Successfully Saved",
                    gravity: ToastGravity.CENTER,
                    toastLength: Toast.LENGTH_SHORT,
            );}
              },
              child: const Text("SAVE"),
            ),
          ),
        ],
      ),
    );
  }
}
