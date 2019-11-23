import 'package:hackatools/utils/prefs.dart';
import 'dart:convert' as convert;

class Usuario{
  String nome;
  String email;
  String course;
  bool isStudent;

  Usuario({
    this.nome,
    this.email,
    this.course,
    this.isStudent,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Usuario &&
          runtimeType == other.runtimeType &&
          nome == other.nome &&
          email == other.email &&
          course == other.course &&
          isStudent == other.isStudent);

  @override
  int get hashCode =>
      nome.hashCode ^ email.hashCode ^ course.hashCode ^ isStudent.hashCode;

  @override
  String toString() {
    return 'Usuario{' +
        ' nome: $nome,' +
        ' email: $email,' +
        ' course: $course,' +
        ' is_student: $isStudent,' +
        '}';
  }

  Usuario copyWith({
    String nome,
    String email,
    String course,
    String isStudent,
  }) {
    return new Usuario(
      nome: nome ?? this.nome,
      email: email ?? this.email,
      course: course ?? this.course,
      isStudent: isStudent ?? this.isStudent,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': this.nome,
      'email': this.email,
      'course': this.course,
      'is_student': this.isStudent,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return new Usuario(
      nome: map['nome'] as String,
      email: map['email'] as String,
      course: map['course'] as String,
      isStudent: map['is_student'] as bool,
    );
  }

  static void clear() {
    Prefs.setString("user.prefs", "");
  }

  void save() {
    Map map = toMap();

    String json = convert.json.encode(map);

    Prefs.setString("user.prefs", json);
  }

  static Future<Usuario> get() async {
    String json = await Prefs.getString("user.prefs");
    if(json.isEmpty) {
      return null;
    }
    Map map = convert.json.decode(json);
    Usuario user = Usuario.fromMap(map);
    return user;
  }

}
