import 'package:faceapp/models/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 240, 239, 239),
          borderRadius: BorderRadius.circular(7)
        ),
        width: double.maxFinite,
        height: 200,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: [
                Text(post.user.name),
                SizedBox(height: 17),
                Text(post.description),
                Text(post.media),
              ],
            )),
      ),
    );
  }
}
