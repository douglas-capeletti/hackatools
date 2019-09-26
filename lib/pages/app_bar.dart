import 'package:flutter/material.dart';
import 'package:hackatools/pages/user/user_page.dart';
import 'package:hackatools/utils/nav.dart';
import 'package:hackatools/widgets/fab_bottom_app_bar.dart';
import 'package:hackatools/widgets/fab_with_icons.dart';
import 'package:hackatools/widgets/layout.dart';

class MainAppBar extends StatefulWidget {

  final String title;
  final Widget body;
  final Widget actions;

  MainAppBar({Key key, @required this.body, @required this.actions, this.title = "HackaTools"}) : super(key: key);

  @override
  _MainAppBarState createState() => new _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> with TickerProviderStateMixin {
  int _lastSelected = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: widget.body,
      bottomNavigationBar: FABBottomAppBar(
        color: Colors.grey,
        selectedColor: Colors.red,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: Icons.today, text: 'Agenda'),
          FABBottomAppBarItem(iconData: Icons.local_play, text: 'Tema'),
          FABBottomAppBarItem(iconData: Icons.accessibility, text: 'Ajuda'),
          FABBottomAppBarItem(iconData: Icons.mail, text: 'Mensagens'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: widget.actions
    );
  }

  void _selectedTab(index) {
    switch(index){
      case 0: push(context, UserInfo(), replace: true);
        break;
      case 1: push(context, UserInfo(), replace: true);
        break;
      case 2: push(context, UserInfo(), replace: true);
        break;
      case 3: push(context, UserInfo(), replace: true);
        break;
    }
  }

  void _selectedFab(int index) {
    setState(() {
      _lastSelected = index;
    });
  }

}