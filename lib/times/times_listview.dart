import 'package:flutter/material.dart';
import 'package:hackatools/database/entities/time.dart';
import 'package:hackatools/detail/detail_body.dart';
import 'package:hackatools/utils/nav.dart';

class TimesListView extends StatelessWidget {
  List<Time> times;

  TimesListView(this.times);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: times.length,
        itemBuilder: (context, index) {
          Time t = times[index];
          var part = t.participantes.length ?? 0;

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
                      t.nome,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 25, fontWeight : FontWeight.bold),
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
