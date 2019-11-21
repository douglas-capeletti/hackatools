import 'package:hackatools/login/dto/LoginDTO.dart';
import 'package:hackatools/login/login_api.dart';
import 'package:hackatools/utils/simple_bloc.dart';

class LoginBloc extends SimpleBloc {

  login(LoginDTO input) async {
    progress.setProgress(true);

    try {
      return await LoginApi.login(input);
    } finally {
      progress.setProgress(false);
    }
  }
}
