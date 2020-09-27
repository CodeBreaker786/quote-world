import 'dart:io';

import 'package:moor_flutter/moor_flutter.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart' as paths;
import 'package:quoteworld/models/phrase_model.dart';
import 'package:quoteworld/models/quote_model.dart';
 

part 'moor_curd.g.dart';

@UseMoor(tables: [Quotes, Phrases])
class AppDatabase extends _$AppDatabase {
  static AppDatabase _db = _constructDb();

  factory AppDatabase() {
    return _db;
  }

  AppDatabase._internal(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 3;

  static AppDatabase _constructDb({bool logStatements = false}) {
    final executor = LazyDatabase(() async {
      final dataDir = await paths.getApplicationDocumentsDirectory();
      final dbFile = File(p.join(dataDir.path, 'db.sqlite'));
      return FlutterQueryExecutor.inDatabaseFolder(
          path: dbFile.path, logStatements: true);
    });
    return AppDatabase._internal(executor);
  }
}
