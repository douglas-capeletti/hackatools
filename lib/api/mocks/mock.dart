import 'package:hackatools/api/api_response.dart';
import 'package:hackatools/database/entities/time.dart';
import 'package:hackatools/database/entities/usuario.dart';

class Mocks {
  static Future<ApiResponse<Usuario>> MockLoginResponse() {
    return Future.value(ApiResponse.ok(Usuario(
        id: 1,
        nome: "Douglas",
        email: "douglas.drpaz@gmail.com",
        matricula: 17103446,
        curso: "ES",
        token: "DOUGLAS|PAZ",
        role: "PARTICIPANTE")));
  }

  static Future<List<Time>> MockGetTimes() {
    return Future.value([
      Time(
          id: 1,
          nome: "Batatas",
          cor: "Roxo",
          proposta: "Dominar o Mundo",
          adminToken: "DOUGLAS|PAZ",
          participantes: [Participante(nome: "Douglas", curso: "ES")]),
      Time(
          id: 2,
          nome: "Cogumelos",
          cor: "Preto",
          proposta: "Ficar Doidao",
          adminToken: "ZE|DROGUINHA",
          participantes: [Participante(nome: "ZE", curso: "SI")])
    ]);
  }
}
