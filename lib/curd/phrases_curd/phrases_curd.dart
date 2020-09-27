import 'package:moor_flutter/moor_flutter.dart';

import 'package:quoteworld/curd/moor_curd.dart';
import 'package:quoteworld/models/phrase_model.dart';
part 'phrases_curd.g.dart';

@UseDao(
  tables: [Phrases],
)
class PhrasesDao extends DatabaseAccessor<AppDatabase> with _$PhrasesDaoMixin {
  final AppDatabase db;

  PhrasesDao(this.db) : super(db);
  Future updateQuote(Phrase phrase) => update(phrases).replace(phrase);
  Future insertQuote(Phrase phrase) => into(phrases).insert(phrase);
  Future deleteQuote(Phrase phrase) => delete(phrases).delete(phrase);
  Future<List<Phrase>> getAllQuotes() {
    return (select(db.phrases).get());
  }
}
