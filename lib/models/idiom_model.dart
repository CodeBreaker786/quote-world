 
import 'package:moor_flutter/moor_flutter.dart';

class Idioms extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get idiom => text().nullable()();
  TextColumn get idiomMeaningLink => text().nullable()();
}
