import 'package:flutter/material.dart';
import 'package:mysqlcrudapp/model/usermodel.dart';
import 'package:mysqlcrudapp/service/userservice.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:form_validation/form_validation.dart';

class AddEditUser extends StatefulWidget {

  final int? index; 
  final UserModel? userModel;
  AddEditUser ({super.key,  this.index,this.userModel,Key});
  // const AddEditUser({Key? key}) : super(key: key);
  @override
  State<AddEditUser> createState() {
    return _AddEditUserState();
  }
}

class _AddEditUserState extends State<AddEditUser> {

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  bool editmode = false; 
  // TextEditingController id = TextEditingController();

  void add(UserModel userModel) async {
    await UserService().addUser(userModel).then(
      (success) { Fluttertoast.showToast(

        msg: "This Field is successful",webPosition: Center,
        timeInSecForIosWeb: 5,
        gravity: ToastGravity.CENTER,
        toastLength: Toast.LENGTH_SHORT,
      );
        Navigator.pop(context);
  },);
  }
  void update(UserModel userModel) async {
    await UserService().addUser(userModel).then(
      (success) { Fluttertoast.showToast(

        msg: "This Field update is successful",webPosition: Center,
        timeInSecForIosWeb: 5,
        gravity: ToastGravity.CENTER,
        toastLength: Toast.LENGTH_SHORT,
      );
        Navigator.pop(context);
  },);
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.index!=null){
      editmode = true;
      name.text = widget.userModel!.email!;
      name.text = widget.userModel!.name!;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(editmode? "Update":"SAVE"),
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
              child:  Text(editmode? "Update":"SAVE"),
            ),
          ),
        ],
      ),
    );
  }
}
