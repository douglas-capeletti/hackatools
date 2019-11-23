

import 'package:flutter/material.dart';
import 'package:hackatools/database/entities/time.dart';
import 'package:hackatools/pages/app_bar.dart';
import 'package:hackatools/pages/detail/detail_page.dart';
import 'package:hackatools/pages/times/times_body.dart';
import 'package:hackatools/widgets/text.dart';

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
