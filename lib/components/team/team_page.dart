import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:hackatools/components/team/team_bloc.dart';
import 'package:hackatools/components/team/team_body.dart';
import 'package:hackatools/widgets/dialog.dart';

import '../app_base_page.dart';

class TimesPage extends StatefulWidget {
  @override
  _TimesPageState createState() => _TimesPageState();
}

class _TimesPageState extends State<TimesPage> with SingleTickerProviderStateMixin<TimesPage> {

  TeamBloc get _bloc => BlocProvider.getBloc<TeamBloc>();

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      body: TimesBody(),
      actions: _actions(),
    );
  }

  _actions(){
    return FloatingActionButton(
      onPressed: _createTeam,
      backgroundColor: Colors.blue,
      child: Icon(Icons.add),
    );
  }

  _createTeam() async {
    var result = DialogWithTextInput(hint: "team name");
    print("$result");
    _bloc.add();
  }

}