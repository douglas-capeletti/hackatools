
import 'dart:async';

import 'package:hackatools/api/api_response.dart';
import 'package:hackatools/api/login_api.dart';
import 'package:hackatools/database/entities/usuario.dart';

class LoginBloc {
  final _streamController = StreamController<bool>();

  get stream => _streamController.stream;

  Future<ApiResponse<Usuario>> login(String login, String senha) async {

    _streamController.add(true);

    ApiResponse response = await LoginApi.login(login, senha);

    _streamController.add(false);

    return response;
  }

  void dispose() {
    _streamController.close();
  }
}