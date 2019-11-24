import 'package:flutter/material.dart';
import 'package:hackatools/user/user_page.dart';
import 'package:hackatools/utils/nav.dart';
import 'package:hackatools/widgets/alert.dart';
import 'package:hackatools/widgets/fab_bottom_app_bar.dart';

class MainAppBar extends StatefulWidget {
  final String title;
  final Widget body;
  final Widget actions;

  MainAppBar(
      {Key key, @required this.body, this.actions, this.title = "HackaTools"})
      : super(key: key);

  @override
  _MainAppBarState createState() => new _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> with TickerProviderStateMixin {
  TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: _barActions(),
        ),
        body: widget.body,
        bottomNavigationBar: AppBarWithFAB(
          color: Colors.grey,
          selectedColor: Colors.red,
          notchedShape: CircularNotchedRectangle(),
          onTabSelected: _selectedTab,
          items: [
            AppBarItem(iconData: Icons.today, text: 'Agenda'),
            AppBarItem(iconData: Icons.local_play, text: 'Tema'),
            AppBarItem(iconData: Icons.accessibility, text: 'Ajuda'),
            AppBarItem(iconData: Icons.mail, text: 'Msgs'),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _defaultFab());
  }

  _barActions() {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.supervised_user_circle),
        onPressed: () => push(context, UserInfo()),
      ),
    ];
  }

  void _selectedTab(index) {
    switch (index) {
      case 0:
        alert(context, "Agenda");
        break;
      case 1:
        alert(context, "Tema");
        break;
      case 2:
        alert(context, "Ajuda");
        break;
      case 3:
        alert(context, "Msgs");
        break;
    }
  }

  Widget _defaultFab() {
    return FloatingActionButton(
      onPressed: _createTeam,
      backgroundColor: Colors.grey,
      child: Icon(Icons.lock),
    );
  }

  _createTeam() async {
    var result = await _displayDialog();
    print("$result");
  }

  _displayDialog() async {
    return showDialog(
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text('HackaTools'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Nome"),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('OK'),
                onPressed: () {
                  Navigator.pop(context, _textFieldController.text);
                  _textFieldController.clear();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
