import 'package:hackatools/database/entities/usuario.dart';
import 'package:hackatools/pages/login/login_page.dart';
import 'package:hackatools/pages/times/times_page.dart';
import 'package:hackatools/utils/db_helper.dart';
import 'package:hackatools/utils/nav.dart';
import 'package:flutter/material.dart';

// Inserir icone no splash screen
class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {

    // Inicializar o banco de dados
    Future futureA = DatabaseHelper.getInstance().db;

    // Avalir se necessario ou não
    Future futureB = Future.delayed(Duration(seconds: 3));

    Future<Usuario> futureC = Usuario.get();

    Future.wait([futureA,futureB,futureC]).then((List values) {
      Usuario user = values[2];
      print(user);

      if (user != null) {
        push(context, TimesPage(), replace: true);
      } else {
        push(context, LoginPage(), replace: true);
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
