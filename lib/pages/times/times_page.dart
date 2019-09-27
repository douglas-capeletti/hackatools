import 'package:flutter/material.dart';
import 'package:hackatools/pages/app_bar.dart';
import 'package:hackatools/pages/times/times_body.dart';

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
