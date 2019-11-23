import 'package:flutter/material.dart';
import 'package:hackatools/user/user_page.dart';
import 'package:hackatools/utils/nav.dart';
import 'package:hackatools/widgets/fab_bottom_app_bar.dart';
import 'package:hackatools/widgets/fab_with_icons.dart';
import 'package:hackatools/widgets/layout.dart';

class MainAppBar extends StatefulWidget {

  final String title;
  final Widget body;

  MainAppBar({Key key, @required this.body, this.title = "HackaTools"}) : super(key: key);

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
      bottomNavigationBar: AppBarWithFAB(
        color: Colors.grey,
        selectedColor: Colors.red,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: (value) => _selectedTab(context, value),
        items: [
          AppBarItem(iconData: Icons.today, text: 'Agenda'),
          AppBarItem(iconData: Icons.local_play, text: 'Assunto'),
          AppBarItem(iconData: Icons.account_box, text: 'Conta'),
          AppBarItem(iconData: Icons.exit_to_app, text: 'Sair'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFab(
          context), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildFab(BuildContext context) {
    final icons = [ Icons.sms, Icons.mail, Icons.phone ];
    return AnchoredOverlay(
      showOverlay: true,
      overlayBuilder: (context, offset) {
        return CenterAbout(
          position: Offset(offset.dx, offset.dy - icons.length * 35.0),
          child: FabWithIcons(
            icons: icons,
            onIconTapped: _selectedFab,
          ),
        );
      },
      child: FloatingActionButton(
        onPressed: () { },
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
    );
  }

  void _selectedTab(context, index) {
    switch(index){
      case 0: pushReplacement(context, UserInfo());
        break;
      case 1: pushReplacement(context, UserInfo());
        break;
      case 2: pushReplacement(context, UserInfo());
        break;
      case 3: pushReplacement(context, UserInfo());
        break;
    }
  }

  void _selectedFab(int index) {
    setState(() {
      _lastSelected = index;
    });
  }

}