import 'package:faceapp/routes/feed/feed_view.dart';
import 'package:faceapp/routes/friends/friends_view.dart';
import 'package:faceapp/routes/login/login_view.dart';
import 'package:faceapp/routes/post/post_view.dart';
import 'package:faceapp/routes/register/register_view.dart';
import 'package:faceapp/routes/request/requests_view.dart';
import 'package:faceapp/routes/users/users_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginViewPage.route: (context) => LoginViewPage(),
        RegisterViewPage.route: (context) => RegisterViewPage(),
        FeedViewPage.route: (context) => FeedViewPage(),
        UsersViewPage.route:(context) => UsersViewPage(),
        RequestsViewPage.route: (context) => RequestsViewPage(),
        FriendsViewPage.route:(context) => FriendsViewPage(),
        PostViewPage.route:(context) => PostViewPage()
      },
      initialRoute: LoginViewPage.route,
    );
  }
}
