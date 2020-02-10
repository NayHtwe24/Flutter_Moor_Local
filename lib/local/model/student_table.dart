import 'package:moor_flutter/moor_flutter.dart';

class Students extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 255)();
  TextColumn get address => text().withLength(min: 4, max: 255)();
  DateTimeColumn get dob => dateTime().nullable()();
  TextColumn get phone => text().withLength(min: 5, max: 12)();

  @override
  Set<Column> get primaryKey => {id};
}