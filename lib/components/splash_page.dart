import 'package:flutter/material.dart';
import 'package:hackatools/components/login/login_page.dart';
import 'package:hackatools/components/team/team_page.dart';
import 'package:hackatools/models/user.dart';
import 'package:hackatools/utils/db_helper.dart';
import 'package:hackatools/utils/nav.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // Inicializar o banco de dados
    Future futureA = DatabaseHelper.getInstance().db;

    Future futureB = Future.delayed(Duration(milliseconds: 1500));

    Future<User> futureC = User.get();

    Future.wait([futureA, futureB, futureC]).then((List values) {
      User user = values[2];
      print(user);

      if (user != null) {
        pushReplacement(context, TimesPage());
      } else {
        pushReplacement(context, LoginPage());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[200],
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
