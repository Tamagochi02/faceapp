import 'package:faceapp/models/session.dart';
import 'package:faceapp/models/user.dart';
import 'package:faceapp/utils/global_config.dart';
import 'package:faceapp/models/post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FeedController {
  // OBTENER POSTS:
  Future<List<Post>> getPosts() async {
    var uri = Uri.http(GlobalConfig.API_URL,
        '/auth/posts'); // Variable que contiene la ruta a la que se hara la peticion

    var response = await http.get(uri, headers: {
      // Peticion de tipo GET
      "Authorization":
          "Bearer ${Session().token}", // Token del usuario con sesion activa
    });

    if (response.statusCode != 200) throw "Ocurrio un error";

    List<dynamic> jsonResponse = jsonDecode(response
        .body); // Guarda en una variable lo decodificado de response.body en formato json

    List<Post> postList =
        jsonResponse.map((post) => Post.fromJson(post)).toList();

    return postList;
  }

  // OBTENER POSTS DE AMIGOS:
  Future<List<Post>> getFriendsPosts() async {
    var uri = Uri.http(GlobalConfig.API_URL,
        "/posts/friends"); // Variable que contiene la ruta a la que se hara la peticion

    // Peticion de tipo GET:
    var response = await http.get(uri, headers: {
      "Content-Type": "application/json",
      "Authorization":
          "Bearer ${Session().token}", // Token del usuario con sesion activa
    });

    List<dynamic> jsonResponse = jsonDecode(response
        .body); // Guarda en una variable lo decodificado de response.body en formato json

    List<Post> postList =
        jsonResponse.map((post) => Post.fromJson(post)).toList();

    return postList;
  }
}
