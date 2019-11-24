import 'package:flutter/material.dart';
import 'package:hackatools/app_bar.dart';
import 'package:hackatools/database/entities/time.dart';
import 'package:hackatools/detail/detail_page.dart';

class DetailBody extends StatefulWidget {
  Time time;

  DetailBody(this.time);

  @override
  _DetailBodyState createState() => _DetailBodyState();
}

class _DetailBodyState extends State<DetailBody> {

  @override
  Widget build(BuildContext context) {
    return MainAppBar(body: DetailPage(widget.time), title: widget.time.nome);
  }
}
