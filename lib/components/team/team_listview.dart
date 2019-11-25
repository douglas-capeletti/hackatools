import 'package:flutter/material.dart';
import 'package:hackatools/components/detail/detail_body.dart';
import 'package:hackatools/models/team.dart';
import 'package:hackatools/utils/nav.dart';

class TimesListView extends StatelessWidget {

  Team mainTeam;
  List<Team> times;

  TimesListView(this.times);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: times.length,
        itemBuilder: (context, index) {
          Team t = times[index];
          var part = t.members.length ?? 0;

          return GestureDetector(
            onTap: () => push(context, DetailBody(t)),
            child: Card(
              color: Colors.blue,
              child: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      t.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Participantes: $part",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
