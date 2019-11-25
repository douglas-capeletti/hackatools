import 'package:flutter/material.dart';
import 'package:hackatools/models/team.dart';

class DetailPage extends StatefulWidget {
  Team time;

  DetailPage(this.time);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with AutomaticKeepAliveClientMixin<DetailPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children(),
        ),
      ),
    );
  }

  List<Widget> children() {
    var response = <Widget>[
          Text(
            widget.time.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            "Admin: ${widget.time.adminName}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ];
    response.addAll(_membersList());
    return response;
  }

  _membersList() {
    return widget.time.members.map((m) =>
        Text(
          "=>>  ${m.name} - (${m.course})",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )).toList();
  }

}
