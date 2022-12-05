import 'package:faceapp/models/session.dart';
import 'package:faceapp/models/user.dart';
import 'package:faceapp/utils/global_config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FriendsController {
  Future<List<User>> getFriends() async {
    var uri = Uri.http(GlobalConfig.API_URL,
        "/friends"); // Variable que contiene la ruta a la que se hara la peticion

    // Peticion de tipo GET:
    var response = await http.get(uri, headers: {
      "Authorization":
          "Bearer ${Session().token}" // Token del usuario con sesion activa
    });

    List<dynamic> jsonResponse = jsonDecode(response
        .body); // Guarda en una variable lo decodificado de response.body en formato json

    List<User> userList = jsonResponse.map((friendRequest) { 
      if(friendRequest["user_source"]["id"]!=Session().user.id){ // Compara si la solicitud no es mia
       return User.fromJson(friendRequest["user_source"]); // Crea un usuario con la persona que me envio solicitud
      }
      return User.fromJson(friendRequest["user_target"]); // Si yo la envie, crea un usuario trayendo a quien se la mande
    }).toList();

    return userList;
  }
}
