import 'package:moor_flutter/moor_flutter.dart';

class Phrases extends Table {

  IntColumn get id => integer().autoIncrement()();
  TextColumn get phraseTitile => text().nullable()();
  TextColumn get phraseDetail => text().nullable()();
  TextColumn get phraseTag => text().nullable()();
  TextColumn get phraseLink => text().nullable()();
 
 
   
}
