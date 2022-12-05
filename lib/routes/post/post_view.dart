import 'package:faceapp/models/session.dart';
import 'package:faceapp/routes/post/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PostViewPage extends StatelessWidget {
  PostViewPage({Key? key}) : super(key: key);
  static const String route = "/postview";
  final _descriptionController = TextEditingController();
  final _controller = PostController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crear publicación"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 37, 36, 102),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17, vertical: 25),
        child: Column(children: [
          Container(
              alignment: Alignment.topLeft,
              child: Text(Session().user.name, style: TextStyle(fontSize: 17))),
          SizedBox(height: 15),
          TextField(
            controller: _descriptionController,
            maxLines: 5,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: const EdgeInsets.all(20),
                label: Text(
                  "Descripción",
                  style: TextStyle(fontSize: 17),
                )),
          ),
          SizedBox(height: 15),
          Container(
            width: 400,
            height: 80,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    primary: Colors.green),
                onPressed: () async {},
                child: Icon(
                  Icons.image_outlined,
                  size: 50,
                )),
          ),
          SizedBox(height: 50),
          SizedBox(
            width: 150,
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  if (_descriptionController.text.isEmpty) {
                    const snackBar =
                        SnackBar(content: Text("No se permiten campos vacios"));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    return;
                  } else {
                    _controller.addPost(_descriptionController.text.trim());
                    const snackBar =
                        SnackBar(content: Text("Has hecho una publicación"));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  "Publicar",
                  style: TextStyle(fontSize: 17),
                )),
          )
        ]),
      ),
    );
  }
}
