import 'dart:convert' as convert;

import 'package:hackatools/database/entities/entity.dart';

class Time extends Entity {
  int id;
  String nome;
  String cor;
  String proposta;
  String adminToken;
  List<Participante> participantes;

  Time(
      {this.id,
      this.nome,
      this.cor,
      this.proposta,
      this.adminToken,
      this.participantes});

  Time.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    cor = json['cor'];
    proposta = json['proposta'];
    adminToken = json['adminToken'];
    if (json['participantes'] != null) {
      participantes = new List<Participante>();
      json['participantes'].forEach((v) {
        participantes.add(new Participante.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['cor'] = this.cor;
    data['proposta'] = this.proposta;
    data['adminToken'] = this.adminToken;
    if (this.participantes != null) {
      data['participantes'] =
          this.participantes.map((v) => v.toJson()).toList();
    }
    return data;
  }

  String toJson() {
    String json = convert.json.encode(toMap());
    return json;
  }

  @override
  String toString() {
    return 'Time{nome: $nome, cor: $cor, proposta: $proposta, matriculaCriador: $adminToken, num participantes: ${participantes.length}}';
  }
}

class Participante {
  String nome;
  String curso;

  Participante({this.nome, this.curso});

  Participante.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    curso = json['curso'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['curso'] = this.curso;
    return data;
  }
}