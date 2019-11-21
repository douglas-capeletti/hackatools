import 'dart:convert' as convert;

import 'package:hackatools/database/entities/usuario.dart';
import 'package:hackatools/login/dto/LoginDTO.dart';
import 'package:hackatools/utils/response.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<GenericResponse<Usuario>> login(LoginDTO l) async {
    try {
      var url =
          'https://hackatools-api.herokuapp.com/v1/usuarios/usuario/login';

      final params = {
        "login": l.login,
        "senha": l.senha,
        "is_student": l.is_student
      };

      print("> Login POST: $url");
      print("> Params: $params");

      final response = await http.post(url, body: params);

      final json = response.body;
      final responseJson = convert.json.decode(json);
      print("< json: $responseJson");

      final responseObject = Usuario.fromJson(responseJson);

      return GenericResponse(true, result: responseObject);
    } catch (error, stacktrace) {
      print("Login error: $error - $stacktrace");
      return GenericResponse(false, msg: "Não foi possível fazer o login");
    }
  }
}
