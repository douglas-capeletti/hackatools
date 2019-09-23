import 'package:hackatools/database/entities/time.dart';
import 'package:hackatools/pages/bloc/times_bloc.dart';
import 'package:hackatools/pages/times/times_listview.dart';
import 'package:hackatools/widgets/text_error.dart';
import 'package:flutter/material.dart';

class TimesPage extends StatefulWidget {
  String status;

  TimesPage({this.status = "OK"});

  @override
  _TimesPageState createState() => _TimesPageState();
}

class _TimesPageState extends State<TimesPage> with AutomaticKeepAliveClientMixin<TimesPage> {
  
  List<Time> times;

  String get tipo => widget.status;

  final _bloc = TimesBloc();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _bloc.fetch();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return StreamBuilder(
      stream: _bloc.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return TextError("Não foi possível buscar os times");
        }

        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        List<Time> times = snapshot.data;

        return RefreshIndicator(
          onRefresh: _onRefresh,
          child: TimesListView(times),
        );
      },
    );
  }

  Future<void> _onRefresh() {
    return _bloc.fetch();
  }

  @override
  void dispose() {
    super.dispose();

    _bloc.dispose();
  }
}
