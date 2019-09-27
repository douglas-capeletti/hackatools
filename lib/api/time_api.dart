import 'dart:convert' as convert;
import 'package:hackatools/api/mocks/mock.dart';
import 'package:hackatools/database/entities/time.dart';
import 'package:hackatools/utils/http_helper.dart' as http;

import 'api_response.dart';

class TimeApi {
  static Future<List<Time>> getTimes({Time created, bool mock = true}) async {
    if(mock){
      return Mocks.MockGetTimes();
    }
    var url =
        'https://hackatools-api.herokuapp.com/v1/times/';

    print("GET > $url");

    var response = await http.get(url);

    String json = response.body;

    List list = convert.json.decode(json);

    return list.map<Time>((map) => Time.fromMap(map)).toList();
  }

  static Future<ApiResponse<bool>> save(String nome, String adminToken, int idAdmin) async {
    try {
      var url = 'https://hackatools-api.herokuapp.com/v1/times/time';

      print("POST > $url");

      Map body = {
          "adminToken": adminToken,
          "idAdmin": idAdmin,
          "nome": nome
      };

      print("   JSON > $body");

      var response = await  http.post(url, body: body);        

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map mapResponse = convert.json.decode(response.body);

        Time time = Time.fromMap(mapResponse);

        print("Novo time: ${time.nome}");

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
