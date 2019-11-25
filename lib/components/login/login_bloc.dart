import 'package:hackatools/components/login/login_api.dart';
import 'package:hackatools/models/dto/LoginDTO.dart';
import 'package:hackatools/utils/simple_bloc.dart';

class LoginBloc extends SimpleBloc {
  login(LoginDTO dto) async {
    progress.setProgress(true);

    try {
      var response = await LoginApi.login(dto);
      if (response.isOk()) {
        response.result.save();
      }
      print("Bloc Responded from logini");
      return response;
    } finally {
      progress.setProgress(false);
    }
  }
}
