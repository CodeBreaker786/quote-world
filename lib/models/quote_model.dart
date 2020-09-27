

import 'package:moor_flutter/moor_flutter.dart';

 
class Quotes extends Table {

  IntColumn get id => integer().autoIncrement()();
  TextColumn get quoteContent => text().nullable()();
  TextColumn get quoteTag => text().nullable()();
  TextColumn get quoteImageUrl => text() ();
  TextColumn get quoteWriter => text()();
   

   
}
