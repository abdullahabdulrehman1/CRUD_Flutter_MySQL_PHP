// import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mysqlcrudapp/service/addedituser.dart';
import 'package:mysqlcrudapp/service/userservice.dart';

import 'model/usermodel.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  List<UserModel> userList=[];
  bool loading = true;
  getAllUser()async{userList = await UserService().getUser();
    loading = false;
  setState(() {
  });
print("user: ${userList.length}");
  
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Model Crud"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddEditUser()),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body:  loading?  Center(child: CircularProgressIndicator(color: Colors.red),) : ListView.builder(
        itemCount: userList.length,itemBuilder: (context,  index )
        {
        UserModel user = userList[index];
      
        return ListTile(
        title: Text("${user.name}" ,style: TextStyle(fontWeight: FontWeight.bold),),

        );
      })
    );
  }
}
