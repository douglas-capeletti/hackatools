import 'dart:convert' as convert;

import 'package:hackatools/api/mocks/mock.dart';
import 'package:hackatools/utils/prefs.dart';

class Usuario {
  int id;
  String nome;
  String email;
  int matricula;
  String curso;
  String token;
  String role;

  Usuario(
      { this.id,
        this.nome,
        this.email,
        this.matricula,
        this.curso,
        this.token,
        this.role});

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    email = json['email'];
    matricula = json['matricula'];
    curso = json['curso'];
    token = json['token'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['matricula'] = this.matricula;
    data['curso'] = this.curso;
    data['token'] = this.token;
    data['roles'] = this.role;
    return data;
  }

  static void clear() {
    Prefs.setString("user.prefs", "");
  }

  void save() {
    Map map = toJson();

    String json = convert.json.encode(map);

    Prefs.setString("user.prefs", json);
  }

  static Future<Usuario> get() async {
    return Future.value(Mocks.MockUsuario());
    String json = await Prefs.getString("user.prefs");
    if(json.isEmpty) {
      return null;
    }
    Map map = convert.json.decode(json);
    Usuario user = Usuario.fromJson(map);
    return user;
  }

  @override
  String toString() {
    return 'Usuario{nome: $nome, email: $email, role: $role}';
  }


}