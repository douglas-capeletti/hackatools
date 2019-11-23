import 'package:hackatools/database/entities/usuario.dart';
import 'package:hackatools/login/dto/LoginDTO.dart';
import 'package:hackatools/utils/response.dart';
import 'package:hackatools/utils/http_helper.dart' as http;

class LoginApi {
  static Future<GenericResponse<Usuario>> login(LoginDTO l) async {
    try {
      var url = 'https://projarq-api.herokuapp.com/login';

      final params = {
        "username": l.login,
        "password": l.senha,
        "is_student": l.is_student
      };

      print("> Login POST: $url");
      print("> Params: $params");

      final response = await http.post(url, body: params);


      final json = response.body;
      print("< json: $json");
      final data = ResponseWrapper.getContent(json);
      print("< data: $data");

      final responseObject = Usuario.fromMap(data);

      return GenericResponse(true, result: responseObject);
    } catch (error, stacktrace) {
      print("Login error: $error - $stacktrace");
      return GenericResponse(false, msg: "Não foi possível fazer o login");
    }
  }
}
