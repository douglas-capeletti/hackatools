import 'package:flutter/material.dart';
import 'package:hackatools/components/app_base_page.dart';
import 'package:hackatools/components/detail/detail_page.dart';
import 'package:hackatools/models/team.dart';

class DetailBody extends StatefulWidget {
  Team time;

  DetailBody(this.time);

  @override
  _DetailBodyState createState() => _DetailBodyState();
}

class _DetailBodyState extends State<DetailBody> {
  @override
  Widget build(BuildContext context) {
    return AppBasePage(body: DetailPage(widget.time), title: widget.time.name);
  }
}
