import 'package:flutter/material.dart';
import 'package:hackatools/login/login_page.dart';
import 'package:hackatools/times/times_body.dart';
import 'package:hackatools/utils/nav.dart';

class TimesPage extends StatefulWidget {
  @override
  _TimesPageState createState() => _TimesPageState();
}

class _TimesPageState extends State<TimesPage>
    with SingleTickerProviderStateMixin<TimesPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HackaTools"),
         actions: <Widget>[
           IconButton(icon: Icon(Icons.exit_to_app), onPressed: () {
             push(context, LoginPage());
           },)
         ],
      ),
      body: TimesBody(),
    );
  }
}