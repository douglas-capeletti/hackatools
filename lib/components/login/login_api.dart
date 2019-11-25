import 'package:hackatools/models/dto/LoginDTO.dart';
import 'package:hackatools/models/user.dart';
import 'package:hackatools/utils/http_helper.dart' as http;
import 'package:hackatools/utils/response.dart';

class LoginApi {
  static Future<GenericResponse<User>> login(LoginDTO dto) async {
    try {
      var url = 'https://projarq-api.herokuapp.com/login';

      final params = {
        "username": dto.login.toLowerCase(),
        "password": dto.senha.toLowerCase(),
        "is_student": dto.is_student
      };

      print("> Login POST: $url");
      print("> Params: $params");

      final response = await http.post(url, body: params);
      var status = response.statusCode;

      if (status > 299) {
        if (status > 499) {
          return mockResponse();
//              return GenericResponse(false, msg: "Ops, sistema temporariamente indisponível!");
        }
        return GenericResponse(false,
            msg: "Dados inválidos de login, tente novamente!");
      }

      final json = response.body;
      print("< response = status: $status | body: $json");
      final data = ResponseWrapper.getContent(json);
      print("< data: $data");

      final responseObject = User.fromMap(data);

      return GenericResponse(true, result: responseObject);
    } catch (error, stacktrace) {
      print("Login error: $error - $stacktrace");
      return GenericResponse(false, msg: "Não foi possível fazer o login");
    }
  }

  static GenericResponse<User> mockResponse() {
    print("----->>>>> Logged with mock user");
    return GenericResponse(
      true,
      result: User(
        name: "Mock",
        email: "mock@email.com",
        course: "ES",
        isStudent: true,
      ),
    );
  }
}
