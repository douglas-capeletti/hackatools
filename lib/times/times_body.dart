import 'package:flutter/material.dart';
import 'package:hackatools/database/entities/time.dart';
import 'package:hackatools/times/times_bloc.dart';
import 'package:hackatools/times/times_listview.dart';
import 'package:hackatools/widgets/text_error.dart';

class TimesBody extends StatefulWidget {

  @override
  _TimesBodyState createState() => _TimesBodyState();
}

class _TimesBodyState extends State<TimesBody> with AutomaticKeepAliveClientMixin<TimesBody> {

  List<Time> times;

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

        return RefreshIndicator(
          onRefresh: _onRefresh,
          child: TimesListView(snapshot.data),
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
