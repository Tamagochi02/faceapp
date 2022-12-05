import 'dart:convert';
import 'package:faceapp/models/session.dart';
import 'package:faceapp/models/user.dart';
import 'package:faceapp/utils/global_config.dart';
import 'package:http/http.dart' as http;

class LoginController {
  Future<Session> signIn(String email, String pass) async {
    var uri = Uri.http(GlobalConfig.API_URL,
        '/auth/login'); // Variable que contiene la ruta a la que se hara la peticion

    // Peticion usando http de tipo post para obtener un usuario:
    var response = await http.post(uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"email": email, "password": pass}));

    if (response.statusCode !=
        200) // Valida si encuentro algo el metodo post, 200 es "ok"
      throw "Error en usuario y/o contraseña";
    var jsonResponse = jsonDecode(response
        .body); // Guarda en una variable lo decodificado de response.body en formato json
    var token = jsonResponse['token'];
    var jsonUser = jsonResponse['user'];

    var user = User(
        id: jsonUser['id'],
        name: jsonUser['name'],
        email: jsonUser[
            'email']); // Guarda un objeto de tipo usuario, a partir del json obtenemos su informacion
    Session.create(token,
        user); // Creamos una sesion a partir del token y usuario obtenidos

    return Session(); // Se retorna la sesion
  }
}
