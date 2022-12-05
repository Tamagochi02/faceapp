import 'dart:ffi';

import 'package:faceapp/models/user.dart';
import 'package:faceapp/routes/request/requests_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserCard extends StatefulWidget {
  final User user;

  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  final _controller = RequestsController();
  bool requestSent = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: InkWell(
          child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(7)),
        width: double.maxFinite,
        height: 100,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Column(
              children: [
                Text(widget.user.name,
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                SizedBox(
                  child: ElevatedButton(
                      onPressed: () {
                        _controller.sendRequest(widget.user.id);
                        requestSent = true;
                      },
                      child: Text(requestSent ? "Solicitud enviada" : "Agregar")),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
            )),
      )),
    );
  }
}
