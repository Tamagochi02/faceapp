import 'dart:convert';
import 'package:faceapp/models/request.dart';
import 'package:faceapp/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:faceapp/models/session.dart';
import 'package:faceapp/utils/global_config.dart';

class RequestsController {
  // ENVIAR SOLICITUD:
  Future<bool> sendRequest(String userId) async {
    var uri = Uri.http(GlobalConfig.API_URL,
        "/friends/${userId}"); // Variable que contiene la ruta a la que se hara la peticion

    // Peticion de tipo POST:
    var response = await http.post(uri, headers: {
      "Content-Type": "application/json",
      "Authorization":
          "Bearer ${Session().token}", // Token del usuario con sesion activa
    });

    if (response.statusCode != 200) {
      return false;
    } else {
      return true;
    }
  }

  Future<List<Request>> getRequests() async {
    var uri = Uri.http(GlobalConfig.API_URL, "/friends/requests");

    var response = await http
        .get(uri, headers: {"Authorization": "Bearer ${Session().token}"});

    List<dynamic> jsonResponse = jsonDecode(response
        .body); // Guarda en una variable lo decodificado de response.body en formato json

    List<Request> requestList =
        jsonResponse.map((request) => Request.fromJson(request)).toList();
        
    return requestList;
  }
}
