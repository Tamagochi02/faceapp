import 'package:faceapp/models/session.dart';
import 'package:faceapp/models/user.dart';
import 'package:faceapp/utils/global_config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UsersController {
// OBTENER USUARIOS:
  Future<List<User>> getUsers() async {
    var uri = Uri.http(GlobalConfig.API_URL,
        "/users"); // Variable que contiene la ruta a la que se hara la peticion

    // Peticion de tipo GET:
    var response = await http.get(uri, headers: {
      "Authorization":
          "Bearer ${Session().token}" // Token del usuario con sesion activa
    });

    List<dynamic> jsonResponse = jsonDecode(response
        .body); // Guarda en una variable lo decodificado de response.body en formato json

    List<User> userList =
        jsonResponse.map((user) => User.fromJson(user)).toList();

    return userList;
  }
}
