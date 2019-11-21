
import 'dart:async';


import 'package:hackatools/database/entities/time.dart';
import 'package:hackatools/times/time_api.dart';

class TimesBloc {

  final _streamController = StreamController<List<Time>>();

  Stream<List<Time>> get stream => _streamController.stream;

  Future<List<Time>> fetch() async {
    try {

      // if(! await isNetworkOn()) {
      //   // Busca do banco de dados
      //   List<Time> times =  await TimeDAO().findAll();
      //   _streamController.add(times);
      //   return times;
      // }

      List<Time> times = await TimeApi.getTimes();

      // if(times.isNotEmpty) {
      //   final dao = TimeDAO();

      //   times.forEach(dao.save);
      // }

      _streamController.add(times);

      return times;
    } catch (e) {
      print(e);
      if(! _streamController.isClosed) {
        _streamController.addError(e);
      }
    }
  }

  void dispose() {
    _streamController.close();
  }
}