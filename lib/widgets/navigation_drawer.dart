import 'package:faceapp/models/session.dart';
import 'package:faceapp/routes/friends/friends_view.dart';
import 'package:faceapp/routes/login/login_controller.dart';
import 'package:faceapp/routes/login/login_view.dart';
import 'package:faceapp/routes/request/requests_view.dart';
import 'package:faceapp/routes/users/users_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class NavigationDrawer extends StatelessWidget {
  final _controller = LoginController();
  NavigationDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 25),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 37, 36, 102),
                  // borderRadius: BorderRadius.circular(5)
                ),
                child: Text(Session().user.name,
                    style: TextStyle(fontSize: 17, color: Colors.white)),
                alignment: Alignment.center,
                width: double.maxFinite,
                height: 60,
              ),
              //
              SizedBox(
                height: 60,
                child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, UsersViewPage.route);
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.people_alt,
                          color: Color.fromARGB(255, 51, 51, 51),
                          size: 27.0,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Usuarios",
                          style: TextStyle(
                              color: Color.fromARGB(255, 51, 51, 51),
                              fontSize: 17),
                        ),
                      ],
                    )),
              ),
              //
              Divider(),
              //
              SizedBox(
                height: 60,
                child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RequestsViewPage.route);
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.person_add,
                          color: Color.fromARGB(255, 51, 51, 51),
                          size: 27.0,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Solicitudes de amistad",
                          style: TextStyle(
                              color: Color.fromARGB(255, 51, 51, 51),
                              fontSize: 17),
                        ),
                      ],
                    )),
              ),
              //
              Divider(),
              //
              SizedBox(
                height: 60,
                child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, FriendsViewPage.route);
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.perm_contact_cal_sharp,
                          color: Color.fromARGB(255, 51, 51, 51),
                          size: 27.0,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Amigos",
                          style: TextStyle(
                              color: Color.fromARGB(255, 51, 51, 51),
                              fontSize: 17),
                        ),
                      ],
                    )),
              ),
              //
              Divider(),
              //
              SizedBox(
                height: 60,
                child: TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, LoginViewPage.route, (route) => false);
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.logout,
                          color: Color.fromARGB(255, 51, 51, 51),
                          size: 27.0,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Cerrar sesion",
                          style: TextStyle(
                              color: Color.fromARGB(255, 51, 51, 51),
                              fontSize: 17),
                        ),
                      ],
                    )),
              ),
            ],
          )),
    );
  }
}
