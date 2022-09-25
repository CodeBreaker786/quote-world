// ignore_for_file: override_on_non_overriding_member
import 'package:moor_flutter/moor_flutter.dart';
import 'package:quoteworld/crud/moor_curd.dart';
import 'package:quoteworld/models/item_model.dart';

part 'quote_crud.g.dart';

@UseDao(
  tables: [
    Items,
  ],
)
class QuoteDao extends DatabaseAccessor<AppDatabase> with _$QuoteDaoMixin {
  final AppDatabase db;

  QuoteDao(this.db) : super(db);
  Future updateQuote(Item item) => update(items).replace(item);
  Future insertQuote(Item item) => into(items).insertOnConflictUpdate(item);
  Future deleteQuote(Item item) => delete(items).delete(item);
  Future deleteAllQuotes() => delete(items).go();

  Stream<List<Item>> watchAllQuotes() {
    return (select(db.items).watch());
  }

  Future<List<Item>> getAllQuotes() {
    return (select(db.items)).get();
  }
}
