import 'package:faceapp/models/user.dart';
import 'package:faceapp/routes/friends/friends_controller.dart';
import 'package:faceapp/widgets/friends_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../widgets/user_card.dart';

class FriendsViewPage extends StatefulWidget {
  static const String route = "/friendssview";
  const FriendsViewPage({Key? key}) : super(key: key);

  @override
  State<FriendsViewPage> createState() => _FriendsViewPageState();
}

class _FriendsViewPageState extends State<FriendsViewPage> {
  final _controller = FriendsController();
  List<User> _friends = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.getFriends().then((users) => setState(() {
          _friends = users;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tus amigos"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 37, 36, 102),
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
              children: _friends.map((user) => FriendsCard(user: user)).toList(),
              )),
    );
  }
}
