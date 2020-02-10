import 'package:db_tester/local/dao/student_dao.dart';
import 'package:db_tester/local/model/student_table.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'app_database.g.dart';

@UseMoor(tables: [Students], daos: [StudentDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(
      FlutterQueryExecutor
          .inDatabaseFolder(path: "db.sqlite", logStatements: true)
  );

  @override
  int get schemaVersion => 1;
}