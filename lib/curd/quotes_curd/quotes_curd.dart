import 'package:moor_flutter/moor_flutter.dart';
import 'package:quoteworld/curd/moor_curd.dart';
import 'package:quoteworld/models/quote_model.dart';

part 'quotes_curd.g.dart';

@UseDao(
  tables: [Quotes],
)
class QuotesDao extends DatabaseAccessor<AppDatabase> with _$QuotesDaoMixin {
  final AppDatabase db;

  QuotesDao(this.db) : super(db);
  Future updateQuote(Quote quote) => update(quotes).replace(quote);
  Future insertQuote(Quote quote) => into(quotes).insert(quote);
  Future deleteQuote(Quote quote) => delete(quotes).delete(quote);
  Future<List<Quote>> getAllQuotes() {
    return (select(db.quotes).get());
  }
}
