import 'package:flutter/material.dart';
import 'package:hackatools/pages/app_bar.dart';
import 'package:hackatools/pages/times/times_body.dart';
import 'package:hackatools/widgets/fab_with_icons.dart';
import 'package:hackatools/widgets/layout.dart';

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
    return MainAppBar(body: TimesBody());
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
            onIconTapped: (value) => {},
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
}
