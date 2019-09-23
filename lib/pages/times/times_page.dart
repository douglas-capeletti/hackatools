import 'package:hackatools/pages/login/login_page.dart';
import 'package:hackatools/pages/user/user_page.dart';
import 'package:hackatools/utils/nav.dart';
import 'package:flutter/material.dart';

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
        // actions: <Widget>[
        //   IconButton(icon: Icon(Icons.exit_to_app), onPressed: () {
        //     push(context, LoginPage());
        //   },)
        // ],
      ),
      body: TimesPage(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onClickfab,
      ),
    );
  }

  void _onClickfab() {
    push(context, UserInfo());
  }
}
