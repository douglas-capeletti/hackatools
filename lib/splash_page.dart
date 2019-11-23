import 'package:flutter/material.dart';
import 'package:hackatools/app_bar.dart';
import 'package:hackatools/database/entities/usuario.dart';
import 'package:hackatools/times/times_body.dart';
import 'package:hackatools/utils/db_helper.dart';
import 'package:hackatools/utils/nav.dart';

import 'login/login_page.dart';

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

    Future<Usuario> futureC = Usuario.get();

    Future.wait([futureA,futureB,futureC]).then((List values) {
      Usuario user = values[2];
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
