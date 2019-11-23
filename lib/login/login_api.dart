import 'package:hackatools/database/entities/usuario.dart';
import 'package:hackatools/login/dto/LoginDTO.dart';
import 'package:hackatools/utils/http_helper.dart' as http;
import 'package:hackatools/utils/response.dart';

class LoginApi {
  static Future<GenericResponse<Usuario>> login(LoginDTO l) async {
    try {
      var url = 'https://projarq-api.herokuapp.com/login';

      final params = {
        "username": l.login.toLowerCase(),
        "password": l.senha.toLowerCase(),
        "is_student": l.is_student
      };

      print("> Login POST: $url");
      print("> Params: $params");

      final response = await http.post(url, body: params);
      var status = response.statusCode;

      if (status > 299) {
        if (status > 499) {
          return GenericResponse(
            true,
            result: Usuario(
              nome: "Mock",
              email: "mock@email.com",
              course: "ES",
              isStudent: true,
            ),
          );
//              return GenericResponse(false, msg: "Ops, sistema temporariamente indisponível!");
        }
        return GenericResponse(false,
            msg: "Dados inválidos de login, tente novamente!");
      }

      final json = response.body;
      print("< response = status: $status | body: $json");
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
