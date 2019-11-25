import 'dart:convert' as convert;

class GenericResponse<T> {
  bool status;
  String msg;

  final T result;

  GenericResponse(this.status, {this.msg, this.result});

  isOk() {
    return status;
  }

  @override
  String toString() {
    return 'Response{ok: $status, msg: $msg, result: $result}';
  }
}

class ResponseWrapper {
  static Map<String, dynamic> getContent(String data) {
    return convert.json.decode(data)['data'] as Map<String, dynamic>;
  }

  static List<dynamic> getContentList(String data) {
    return convert.json.decode(data)['data'] as List<dynamic>;
  }
}
