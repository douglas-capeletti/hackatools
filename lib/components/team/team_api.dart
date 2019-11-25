import 'dart:convert' as convert;

import 'package:hackatools/models/team.dart';
import 'package:hackatools/utils/api_response.dart';
import 'package:hackatools/utils/http_helper.dart' as http;
import 'package:hackatools/utils/response.dart';

class TeamApi {
  static Future<List<Team>> getTimes() async {
    try {
      var url = 'https://projarq-api.herokuapp.com/equipes';

      print("GET > $url");

      var response = await http.get(url);
      var status = response.statusCode;

      if (status > 299) {
        if (status > 499) {
          return mockResponse();
        }
        return throw Exception();
      }

      String json = response.body;
      print("< response = status: $status | body: $json");
      final data = ResponseWrapper.getContentList(json);
      print("< data: $data");

      return data.map<Team>((map) => Team.fromMap(map)).toList();
    } catch (error, stacktrace) {
      print("Team find: $error - $stacktrace");
      return throw Exception("Erro ao buscar lista de times");
    }
  }

  static List<Team> mockResponse() {
    print("----->>>>> Response with mock teams");
    return List.filled(
      1,
      Team(
        name: "Exemplo",
        adminName: "mock@email.com",
        members: List.filled(
          1,
          TeamMember(
            name: "Mock",
            course: "ES",
            username: "mock@email.com",
          ),
        ),
      ),
    );
  }

  static Future<ApiResponse<bool>> save(
      String nome, String adminToken, int idAdmin) async {
    try {
      var url = 'https://hackatools-api.herokuapp.com/v1/times/time';

      print("POST > $url");

      Map body = {"adminToken": adminToken, "idAdmin": idAdmin, "nome": nome};

      print("   JSON > $body");

      var response = await http.post(url, body: body);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map mapResponse = convert.json.decode(response.body);

        Team time = Team.fromMap(mapResponse);

        print("Novo time: ${time.name}");

        return ApiResponse.ok(true);
      }

      if (response.body == null || response.body.isEmpty) {
        return ApiResponse.error("Não foi possível salvar o time");
      }

      Map mapResponse = convert.json.decode(response.body);
      return ApiResponse.error(mapResponse["error"]);
    } catch (e) {
      print(e);

      return ApiResponse.error("Não foi possível salvar o time");
    }
  }
}
