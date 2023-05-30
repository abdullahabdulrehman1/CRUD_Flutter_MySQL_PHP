import 'package:flutter/material.dart';
import 'package:mysqlcrudapp/model/usermodel.dart';
import 'package:mysqlcrudapp/service/addedituser.dart';
import 'package:mysqlcrudapp/service/userservice.dart';

class UserView extends StatefulWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  List<UserModel> userList = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getAllUser();
  }

  Future<void> getAllUser() async {
    try {
      final userService = UserService();
      userList = await userService.getUser();
      setState(() {
        loading = false;
      });
    } catch (e) {
      setState(() {
        loading = false;
      });
      print('Error fetching user data: $e');
    }
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
      body: loading
          ? Center(child: CircularProgressIndicator(color: Colors.red))
          : ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                UserModel user = userList[index];
                return ListTile(
                  title: Text(user.name !),
                  leading: CircleAvatar(child:  Image.asset("c1.png",height: 40,width: 40,),),
                  subtitle: Text(user.email!),
                );
              },
            ),
    );
  }
}
