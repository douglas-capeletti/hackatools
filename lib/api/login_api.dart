import 'dart:convert';
import 'package:hackatools/database/entities/usuario.dart';
import 'package:http/http.dart' as http;

import 'api_response.dart';

class LoginApi {
  static Future<ApiResponse<Usuario>> login(String email, String matricula) async {
    try {
      var url = 'https://hackatools-api.herokuapp.com/v1/usuarios/usuario/login';

      Map<String,String> headers = {
        "Content-Type": "application/json"
      };

      Map params = {
        "email": email,
        "matricula": matricula
      };

      String s = json.encode(params);
      print(">> $s");

      var response = await http.post(url, body: s, headers: headers);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      Map mapResponse = json.decode(response.body);

      if(response.statusCode == 200) {
        final user = Usuario.fromJson(mapResponse);

        // user.save();

        return ApiResponse.ok(user);
      }

      return ApiResponse.error(mapResponse["error"]);
    } catch(error, exception) {
      print("Erro no login $error > $exception");

      return ApiResponse.error("Não foi possível fazer o login.");
    }
  }
}
