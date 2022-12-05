import 'package:faceapp/models/user.dart';
import 'package:faceapp/routes/users/users_controller.dart';
import 'package:faceapp/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UsersViewPage extends StatefulWidget {
  static const String route = "/usersview";
  const UsersViewPage({Key? key}) : super(key: key);

  @override
  State<UsersViewPage> createState() => _UsersViewPageState();
}

class _UsersViewPageState extends State<UsersViewPage> {
  final _controller = UsersController();
  List<User> _users = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.getUsers().then((users) => setState(() {
          _users = users;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Usuarios"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 37, 36, 102),
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: _users.map((user) => UserCard(user: user)).toList(),
          )),
    );
  }
}
