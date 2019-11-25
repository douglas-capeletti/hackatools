import 'package:flutter/material.dart';
import 'package:hackatools/components/drawer_list.dart';
import 'package:hackatools/widgets/alert.dart';
import 'package:hackatools/widgets/app_bar.dart';

class AppBasePage extends StatefulWidget {
  final String title;
  final Widget body;
  final FloatingActionButton actions;
  final AppBarWithFAB customBar;

  AppBasePage(
      {Key key, this.title = "HackaTools", @required this.body, this.actions, this.customBar})
      : super(key: key);

  @override
  _AppBasePageState createState() => new _AppBasePageState();
}

class _AppBasePageState extends State<AppBasePage> {

  bool mockData = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: _barActions(),
      ),
      drawer: DrawerList(),
      body: widget.body,
      bottomNavigationBar: widget.customBar ?? _defaultBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: widget.actions ?? _defaultFab(),
    );
  }

  _defaultBar() {
    return AppBarWithFAB(
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
      );
  }

  _barActions() {
    return <Widget>[
      IconButton(
          icon: Icon(Icons.bug_report),
          onPressed: () => () {
                mockData = !mockData;
                alert(context, "Mock Status: $mockData");
              }),
    ];
  }

  _selectedTab(index) {
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

  _defaultFab() {
    return FloatingActionButton(
      onPressed: alert(context, "Blocked"),
      backgroundColor: Colors.grey,
      child: Icon(Icons.lock),
    );
  }

}
