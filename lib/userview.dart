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
                MaterialPageRoute(builder: (context) => AddEditUser(),),).then((value)=>getAllUser(),
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
                  onTap: () {
                    
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AddEditUser(index: index,userModel: user,))).then((value) => getAllUser());
                  },
                  title: Text(user.name !),
               leading:  CircleAvatar(child: Text(user.name![0])),
                  subtitle: Text(user.email!),
                  trailing: IconButton(onPressed: (){
 

                  }, icon: Icon(Icons.delete)),
                );
              },
            ),
    );
  }
}
