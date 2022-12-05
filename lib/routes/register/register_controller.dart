import 'package:faceapp/models/user.dart';
import 'package:faceapp/utils/global_config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterController {
  Future<void> add(String name, String email, String pass) async {
    var uri = Uri.http(GlobalConfig.API_URL,
        '/auth/register'); // Variable que contiene la ruta a la que se hara la peticion

    // Variable donde se realiza una peticion tipo POST
    var response = await http.post(uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"name": name, "email": email, "password": pass}));

    if (response.statusCode != 200) // Valida si encuentro algo el metodo post, 200 es "ok"
      throw "Error: "+response.statusCode.toString(); 
    print(response.statusCode.toString()+" Se realizo el registro");
  }
}
