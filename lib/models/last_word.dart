import 'package:moor_flutter/moor_flutter.dart';

class LastWords extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().nullable()();
  TextColumn get lastWords => text().nullable()();
  TextColumn get imageLink => text().nullable()();
  TextColumn get lastWordsReceiver => text().nullable()();
  TextColumn get deathAndBirthDates => text().nullable()();
}
