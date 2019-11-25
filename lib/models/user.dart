import 'dart:convert' as convert;

import 'package:hackatools/utils/prefs.dart';

class User {
  String name;
  String email;
  String course;
  bool isStudent;

  User({
    this.name = "",
    this.email = "",
    this.course = "",
    this.isStudent = true,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          email == other.email &&
          course == other.course &&
          isStudent == other.isStudent);

  @override
  int get hashCode =>
      name.hashCode ^ email.hashCode ^ course.hashCode ^ isStudent.hashCode;

  @override
  String toString() {
    return 'Usuario{' +
        ' name: $name,' +
        ' email: $email,' +
        ' course: $course,' +
        ' is_student: $isStudent,' +
        '}';
  }

  User copyWith({
    String nome,
    String email,
    String course,
    String isStudent,
  }) {
    return new User(
      name: nome ?? this.name,
      email: email ?? this.email,
      course: course ?? this.course,
      isStudent: isStudent ?? this.isStudent,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'email': this.email,
      'course': this.course,
      'is_student': this.isStudent,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return new User(
      name: map['name'] as String,
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

  static Future<User> get() async {
    String json = await Prefs.getString("user.prefs");
    if (json.isEmpty) {
      return null;
    }
    Map map = convert.json.decode(json);
    User user = User.fromMap(map);
    return user;
  }

}
