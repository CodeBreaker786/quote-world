import 'package:moor_flutter/moor_flutter.dart';

class Items extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();
  TextColumn get content => text().nullable()();
  TextColumn get att1 => text().nullable()();
  TextColumn get att2 => text().nullable()();
  TextColumn get att3 => text().nullable()();
  TextColumn get imageUrl => text().nullable()();
  TextColumn get type => text().nullable()();
  TextColumn get quoteWriter => text()();
}
