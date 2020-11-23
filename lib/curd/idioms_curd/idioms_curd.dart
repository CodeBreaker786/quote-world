import 'package:moor_flutter/moor_flutter.dart';
import 'package:quoteworld/curd/moor_curd.dart';
import 'package:quoteworld/models/idiom_model.dart';

part 'idioms_curd.g.dart';

@UseDao(
  tables: [Idioms],
)
class IdiomsDao extends DatabaseAccessor<AppDatabase> with _$IdiomsDaoMixin {
  final AppDatabase db;

  IdiomsDao(this.db) : super(db);
  Future updateIdiom(Idiom idiom) => update(idioms).replace(idiom);
  Future insertIdiom(Idiom idiom) => into(idioms).insert(idiom);
  Future deleteIdiom(Idiom idiom) => delete(idioms).delete(idiom);
  Future<List<Idiom>> getAllIdiom() {
    return (select(db.idioms).get());
  }
}
