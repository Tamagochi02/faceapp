import 'package:faceapp/models/post.dart';
import 'package:faceapp/models/session.dart';
import 'package:faceapp/models/user.dart';
import 'package:faceapp/routes/feed/feed_controller.dart';
import 'package:faceapp/routes/post/post_view.dart';
import 'package:faceapp/widgets/navigation_drawer.dart';
import 'package:faceapp/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class FeedViewPage extends StatefulWidget {
  static const String route = "/feed";

  FeedViewPage({Key? key}) : super(key: key);

  @override
  State<FeedViewPage> createState() => _FeedViewPageState();
}

class _FeedViewPageState extends State<FeedViewPage> {
  final _controller = FeedController();
  List<Post> _post = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.getFriendsPosts().then((posts) => setState(() {
          _post = posts;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Social App"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 37, 36, 102),
      ),
      drawer: NavigationDrawer(),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: _post.map((post) => PostCard(post: post)).toList(),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, PostViewPage.route);
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
