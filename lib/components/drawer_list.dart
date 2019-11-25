import 'package:flutter/material.dart';
import 'package:hackatools/components/login/login_page.dart';
import 'package:hackatools/models/user.dart';
import 'package:hackatools/utils/nav.dart';

class DrawerList extends StatelessWidget {
  UserAccountsDrawerHeader _header(User user) {
    return UserAccountsDrawerHeader(
      accountName: Text(user.name),
      accountEmail: Text(user.email),
      currentAccountPicture: CircleAvatar(
        child: Image.asset("assets/images/camera.png"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<User> future = User.get();

    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            FutureBuilder<User>(
              future: future,
              builder: (context, snapshot) {
                User user = snapshot.data;

                return user != null ? _header(user) : Container();
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Favoritos"),
              subtitle: Text("mais informações..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print("Item 1");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Ajuda"),
              subtitle: Text("mais informações..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print("Item 1");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => _onClickLogout(context),
            )
          ],
        ),
      ),
    );
  }

  _onClickLogout(BuildContext context) {
    User.clear();
    Navigator.pop(context);
    pushReplacement(context, LoginPage());
  }
}
