import 'package:moor_flutter/moor_flutter.dart';
import 'package:quoteworld/models/last_word.dart';

import '../moor_curd.dart';

part 'lastword_curd.g.dart';

@UseDao(
  tables: [LastWords],
)
class LastWordsDao extends DatabaseAccessor<AppDatabase> with _$LastWordsDaoMixin {
  final AppDatabase db;

  LastWordsDao(this.db) : super(db);
  Future updateLastWord(LastWord lastWord) =>
      update(lastWords).replace(lastWord);
  Future insertLastWord(LastWord lastWord) => into(lastWords).insert(lastWord);
  Future deleteLastWord(LastWord lastWord) =>
      delete(lastWords).delete(lastWord);
  Future<List<LastWord>> getAllLastWord() {
    return (select(db.lastWords).get());
  }
}
