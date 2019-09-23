import 'package:hackatools/database/base_dao.dart';
import 'package:hackatools/database/entities/time.dart';

// Data Access Object
class TimeDAO extends BaseDAO<Time> {

  @override
  String get tableName => "table_time";

  @override
  Time fromMap(Map<String, dynamic> map) {
    return Time.fromMap(map);
  }

}
