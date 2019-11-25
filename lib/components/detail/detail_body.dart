import 'package:flutter/material.dart';
import 'package:hackatools/components/app_base_page.dart';
import 'package:hackatools/components/detail/detail_page.dart';
import 'package:hackatools/components/team/team_bloc.dart';
import 'package:hackatools/models/team.dart';
import 'package:hackatools/widgets/dialog.dart';

class DetailBody extends StatefulWidget {
  Team team;

  DetailBody(this.team);

  @override
  _DetailBodyState createState() => _DetailBodyState();
}

class _DetailBodyState extends State<DetailBody> with SingleTickerProviderStateMixin<DetailBody> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.team.name)
      ),
      body: DetailPage(widget.team),
    );
  }

}
