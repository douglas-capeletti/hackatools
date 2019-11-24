import 'package:flutter/material.dart';
import 'package:hackatools/times/times_body.dart';

import '../app_bar.dart';

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
}
