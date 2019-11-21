class LoginDTO {
  String login;
  String senha;
  bool is_student = true;

  toMap() {
    return {
      "login": login,
      "senha": senha,
      "is_student": is_student
    };
  }
}