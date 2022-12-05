import 'dart:convert';
import 'package:faceapp/models/session.dart';
import 'package:http/http.dart' as http;
import 'package:faceapp/utils/global_config.dart';

class PostController {
  Future<void> addPost(String description) async {
    var uri = Uri.http(GlobalConfig.API_URL,
        '/posts'); // Variable que contiene la ruta a la que se hara la peticion

    // Variable donde se realiza una peticion tipo POST
    var response = await http.post(uri,
        headers: {
          'Content-Type': 'application/json',
          "Authorization": "Bearer ${Session().token}"
        },
        body: jsonEncode({
          "description": description,
          "media": {"ext": "", "b64": ""}
        }));

    if (response.statusCode != 200) { // Valida si encuentro algo el metodo post, 200 es "ok"
      print("Error: " + response.statusCode.toString());
    } else {
      print(response.statusCode.toString() + "Has hecho una publicación");
    }
  }
}
