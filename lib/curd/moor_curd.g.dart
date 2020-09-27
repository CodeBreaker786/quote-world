// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_curd.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Quote extends DataClass implements Insertable<Quote> {
  final int id;
  final String quoteContent;
  final String quoteTag;
  final String quoteImageUrl;
  final String quoteWriter;
  Quote(
      {@required this.id,
      this.quoteContent,
      this.quoteTag,
      @required this.quoteImageUrl,
      @required this.quoteWriter});
  factory Quote.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Quote(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      quoteContent: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}quote_content']),
      quoteTag: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}quote_tag']),
      quoteImageUrl: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}quote_image_url']),
      quoteWriter: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}quote_writer']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || quoteContent != null) {
      map['quote_content'] = Variable<String>(quoteContent);
    }
    if (!nullToAbsent || quoteTag != null) {
      map['quote_tag'] = Variable<String>(quoteTag);
    }
    if (!nullToAbsent || quoteImageUrl != null) {
      map['quote_image_url'] = Variable<String>(quoteImageUrl);
    }
    if (!nullToAbsent || quoteWriter != null) {
      map['quote_writer'] = Variable<String>(quoteWriter);
    }
    return map;
  }

  QuotesCompanion toCompanion(bool nullToAbsent) {
    return QuotesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      quoteContent: quoteContent == null && nullToAbsent
          ? const Value.absent()
          : Value(quoteContent),
      quoteTag: quoteTag == null && nullToAbsent
          ? const Value.absent()
          : Value(quoteTag),
      quoteImageUrl: quoteImageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(quoteImageUrl),
      quoteWriter: quoteWriter == null && nullToAbsent
          ? const Value.absent()
          : Value(quoteWriter),
    );
  }

  factory Quote.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Quote(
      id: serializer.fromJson<int>(json['id']),
      quoteContent: serializer.fromJson<String>(json['quoteContent']),
      quoteTag: serializer.fromJson<String>(json['quoteTag']),
      quoteImageUrl: serializer.fromJson<String>(json['quoteImageUrl']),
      quoteWriter: serializer.fromJson<String>(json['quoteWriter']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'quoteContent': serializer.toJson<String>(quoteContent),
      'quoteTag': serializer.toJson<String>(quoteTag),
      'quoteImageUrl': serializer.toJson<String>(quoteImageUrl),
      'quoteWriter': serializer.toJson<String>(quoteWriter),
    };
  }

  Quote copyWith(
          {int id,
          String quoteContent,
          String quoteTag,
          String quoteImageUrl,
          String quoteWriter}) =>
      Quote(
        id: id ?? this.id,
        quoteContent: quoteContent ?? this.quoteContent,
        quoteTag: quoteTag ?? this.quoteTag,
        quoteImageUrl: quoteImageUrl ?? this.quoteImageUrl,
        quoteWriter: quoteWriter ?? this.quoteWriter,
      );
  @override
  String toString() {
    return (StringBuffer('Quote(')
          ..write('id: $id, ')
          ..write('quoteContent: $quoteContent, ')
          ..write('quoteTag: $quoteTag, ')
          ..write('quoteImageUrl: $quoteImageUrl, ')
          ..write('quoteWriter: $quoteWriter')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          quoteContent.hashCode,
          $mrjc(quoteTag.hashCode,
              $mrjc(quoteImageUrl.hashCode, quoteWriter.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Quote &&
          other.id == this.id &&
          other.quoteContent == this.quoteContent &&
          other.quoteTag == this.quoteTag &&
          other.quoteImageUrl == this.quoteImageUrl &&
          other.quoteWriter == this.quoteWriter);
}

class QuotesCompanion extends UpdateCompanion<Quote> {
  final Value<int> id;
  final Value<String> quoteContent;
  final Value<String> quoteTag;
  final Value<String> quoteImageUrl;
  final Value<String> quoteWriter;
  const QuotesCompanion({
    this.id = const Value.absent(),
    this.quoteContent = const Value.absent(),
    this.quoteTag = const Value.absent(),
    this.quoteImageUrl = const Value.absent(),
    this.quoteWriter = const Value.absent(),
  });
  QuotesCompanion.insert({
    this.id = const Value.absent(),
    this.quoteContent = const Value.absent(),
    this.quoteTag = const Value.absent(),
    @required String quoteImageUrl,
    @required String quoteWriter,
  })  : quoteImageUrl = Value(quoteImageUrl),
        quoteWriter = Value(quoteWriter);
  static Insertable<Quote> custom({
    Expression<int> id,
    Expression<String> quoteContent,
    Expression<String> quoteTag,
    Expression<String> quoteImageUrl,
    Expression<String> quoteWriter,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (quoteContent != null) 'quote_content': quoteContent,
      if (quoteTag != null) 'quote_tag': quoteTag,
      if (quoteImageUrl != null) 'quote_image_url': quoteImageUrl,
      if (quoteWriter != null) 'quote_writer': quoteWriter,
    });
  }

  QuotesCompanion copyWith(
      {Value<int> id,
      Value<String> quoteContent,
      Value<String> quoteTag,
      Value<String> quoteImageUrl,
      Value<String> quoteWriter}) {
    return QuotesCompanion(
      id: id ?? this.id,
      quoteContent: quoteContent ?? this.quoteContent,
      quoteTag: quoteTag ?? this.quoteTag,
      quoteImageUrl: quoteImageUrl ?? this.quoteImageUrl,
      quoteWriter: quoteWriter ?? this.quoteWriter,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (quoteContent.present) {
      map['quote_content'] = Variable<String>(quoteContent.value);
    }
    if (quoteTag.present) {
      map['quote_tag'] = Variable<String>(quoteTag.value);
    }
    if (quoteImageUrl.present) {
      map['quote_image_url'] = Variable<String>(quoteImageUrl.value);
    }
    if (quoteWriter.present) {
      map['quote_writer'] = Variable<String>(quoteWriter.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuotesCompanion(')
          ..write('id: $id, ')
          ..write('quoteContent: $quoteContent, ')
          ..write('quoteTag: $quoteTag, ')
          ..write('quoteImageUrl: $quoteImageUrl, ')
          ..write('quoteWriter: $quoteWriter')
          ..write(')'))
        .toString();
  }
}

class $QuotesTable extends Quotes with TableInfo<$QuotesTable, Quote> {
  final GeneratedDatabase _db;
  final String _alias;
  $QuotesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _quoteContentMeta =
      const VerificationMeta('quoteContent');
  GeneratedTextColumn _quoteContent;
  @override
  GeneratedTextColumn get quoteContent =>
      _quoteContent ??= _constructQuoteContent();
  GeneratedTextColumn _constructQuoteContent() {
    return GeneratedTextColumn(
      'quote_content',
      $tableName,
      true,
    );
  }

  final VerificationMeta _quoteTagMeta = const VerificationMeta('quoteTag');
  GeneratedTextColumn _quoteTag;
  @override
  GeneratedTextColumn get quoteTag => _quoteTag ??= _constructQuoteTag();
  GeneratedTextColumn _constructQuoteTag() {
    return GeneratedTextColumn(
      'quote_tag',
      $tableName,
      true,
    );
  }

  final VerificationMeta _quoteImageUrlMeta =
      const VerificationMeta('quoteImageUrl');
  GeneratedTextColumn _quoteImageUrl;
  @override
  GeneratedTextColumn get quoteImageUrl =>
      _quoteImageUrl ??= _constructQuoteImageUrl();
  GeneratedTextColumn _constructQuoteImageUrl() {
    return GeneratedTextColumn(
      'quote_image_url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _quoteWriterMeta =
      const VerificationMeta('quoteWriter');
  GeneratedTextColumn _quoteWriter;
  @override
  GeneratedTextColumn get quoteWriter =>
      _quoteWriter ??= _constructQuoteWriter();
  GeneratedTextColumn _constructQuoteWriter() {
    return GeneratedTextColumn(
      'quote_writer',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, quoteContent, quoteTag, quoteImageUrl, quoteWriter];
  @override
  $QuotesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'quotes';
  @override
  final String actualTableName = 'quotes';
  @override
  VerificationContext validateIntegrity(Insertable<Quote> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('quote_content')) {
      context.handle(
          _quoteContentMeta,
          quoteContent.isAcceptableOrUnknown(
              data['quote_content'], _quoteContentMeta));
    }
    if (data.containsKey('quote_tag')) {
      context.handle(_quoteTagMeta,
          quoteTag.isAcceptableOrUnknown(data['quote_tag'], _quoteTagMeta));
    }
    if (data.containsKey('quote_image_url')) {
      context.handle(
          _quoteImageUrlMeta,
          quoteImageUrl.isAcceptableOrUnknown(
              data['quote_image_url'], _quoteImageUrlMeta));
    } else if (isInserting) {
      context.missing(_quoteImageUrlMeta);
    }
    if (data.containsKey('quote_writer')) {
      context.handle(
          _quoteWriterMeta,
          quoteWriter.isAcceptableOrUnknown(
              data['quote_writer'], _quoteWriterMeta));
    } else if (isInserting) {
      context.missing(_quoteWriterMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Quote map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Quote.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $QuotesTable createAlias(String alias) {
    return $QuotesTable(_db, alias);
  }
}

class Phrase extends DataClass implements Insertable<Phrase> {
  final int id;
  final String phraseTitile;
  final String phraseDetail;
  final String phraseTag;
  final String phraseLink;
  Phrase(
      {@required this.id,
      this.phraseTitile,
      this.phraseDetail,
      this.phraseTag,
      this.phraseLink});
  factory Phrase.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Phrase(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      phraseTitile: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}phrase_titile']),
      phraseDetail: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}phrase_detail']),
      phraseTag: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}phrase_tag']),
      phraseLink: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}phrase_link']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || phraseTitile != null) {
      map['phrase_titile'] = Variable<String>(phraseTitile);
    }
    if (!nullToAbsent || phraseDetail != null) {
      map['phrase_detail'] = Variable<String>(phraseDetail);
    }
    if (!nullToAbsent || phraseTag != null) {
      map['phrase_tag'] = Variable<String>(phraseTag);
    }
    if (!nullToAbsent || phraseLink != null) {
      map['phrase_link'] = Variable<String>(phraseLink);
    }
    return map;
  }

  PhrasesCompanion toCompanion(bool nullToAbsent) {
    return PhrasesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      phraseTitile: phraseTitile == null && nullToAbsent
          ? const Value.absent()
          : Value(phraseTitile),
      phraseDetail: phraseDetail == null && nullToAbsent
          ? const Value.absent()
          : Value(phraseDetail),
      phraseTag: phraseTag == null && nullToAbsent
          ? const Value.absent()
          : Value(phraseTag),
      phraseLink: phraseLink == null && nullToAbsent
          ? const Value.absent()
          : Value(phraseLink),
    );
  }

  factory Phrase.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Phrase(
      id: serializer.fromJson<int>(json['id']),
      phraseTitile: serializer.fromJson<String>(json['phraseTitile']),
      phraseDetail: serializer.fromJson<String>(json['phraseDetail']),
      phraseTag: serializer.fromJson<String>(json['phraseTag']),
      phraseLink: serializer.fromJson<String>(json['phraseLink']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'phraseTitile': serializer.toJson<String>(phraseTitile),
      'phraseDetail': serializer.toJson<String>(phraseDetail),
      'phraseTag': serializer.toJson<String>(phraseTag),
      'phraseLink': serializer.toJson<String>(phraseLink),
    };
  }

  Phrase copyWith(
          {int id,
          String phraseTitile,
          String phraseDetail,
          String phraseTag,
          String phraseLink}) =>
      Phrase(
        id: id ?? this.id,
        phraseTitile: phraseTitile ?? this.phraseTitile,
        phraseDetail: phraseDetail ?? this.phraseDetail,
        phraseTag: phraseTag ?? this.phraseTag,
        phraseLink: phraseLink ?? this.phraseLink,
      );
  @override
  String toString() {
    return (StringBuffer('Phrase(')
          ..write('id: $id, ')
          ..write('phraseTitile: $phraseTitile, ')
          ..write('phraseDetail: $phraseDetail, ')
          ..write('phraseTag: $phraseTag, ')
          ..write('phraseLink: $phraseLink')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          phraseTitile.hashCode,
          $mrjc(phraseDetail.hashCode,
              $mrjc(phraseTag.hashCode, phraseLink.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Phrase &&
          other.id == this.id &&
          other.phraseTitile == this.phraseTitile &&
          other.phraseDetail == this.phraseDetail &&
          other.phraseTag == this.phraseTag &&
          other.phraseLink == this.phraseLink);
}

class PhrasesCompanion extends UpdateCompanion<Phrase> {
  final Value<int> id;
  final Value<String> phraseTitile;
  final Value<String> phraseDetail;
  final Value<String> phraseTag;
  final Value<String> phraseLink;
  const PhrasesCompanion({
    this.id = const Value.absent(),
    this.phraseTitile = const Value.absent(),
    this.phraseDetail = const Value.absent(),
    this.phraseTag = const Value.absent(),
    this.phraseLink = const Value.absent(),
  });
  PhrasesCompanion.insert({
    this.id = const Value.absent(),
    this.phraseTitile = const Value.absent(),
    this.phraseDetail = const Value.absent(),
    this.phraseTag = const Value.absent(),
    this.phraseLink = const Value.absent(),
  });
  static Insertable<Phrase> custom({
    Expression<int> id,
    Expression<String> phraseTitile,
    Expression<String> phraseDetail,
    Expression<String> phraseTag,
    Expression<String> phraseLink,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (phraseTitile != null) 'phrase_titile': phraseTitile,
      if (phraseDetail != null) 'phrase_detail': phraseDetail,
      if (phraseTag != null) 'phrase_tag': phraseTag,
      if (phraseLink != null) 'phrase_link': phraseLink,
    });
  }

  PhrasesCompanion copyWith(
      {Value<int> id,
      Value<String> phraseTitile,
      Value<String> phraseDetail,
      Value<String> phraseTag,
      Value<String> phraseLink}) {
    return PhrasesCompanion(
      id: id ?? this.id,
      phraseTitile: phraseTitile ?? this.phraseTitile,
      phraseDetail: phraseDetail ?? this.phraseDetail,
      phraseTag: phraseTag ?? this.phraseTag,
      phraseLink: phraseLink ?? this.phraseLink,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (phraseTitile.present) {
      map['phrase_titile'] = Variable<String>(phraseTitile.value);
    }
    if (phraseDetail.present) {
      map['phrase_detail'] = Variable<String>(phraseDetail.value);
    }
    if (phraseTag.present) {
      map['phrase_tag'] = Variable<String>(phraseTag.value);
    }
    if (phraseLink.present) {
      map['phrase_link'] = Variable<String>(phraseLink.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PhrasesCompanion(')
          ..write('id: $id, ')
          ..write('phraseTitile: $phraseTitile, ')
          ..write('phraseDetail: $phraseDetail, ')
          ..write('phraseTag: $phraseTag, ')
          ..write('phraseLink: $phraseLink')
          ..write(')'))
        .toString();
  }
}

class $PhrasesTable extends Phrases with TableInfo<$PhrasesTable, Phrase> {
  final GeneratedDatabase _db;
  final String _alias;
  $PhrasesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _phraseTitileMeta =
      const VerificationMeta('phraseTitile');
  GeneratedTextColumn _phraseTitile;
  @override
  GeneratedTextColumn get phraseTitile =>
      _phraseTitile ??= _constructPhraseTitile();
  GeneratedTextColumn _constructPhraseTitile() {
    return GeneratedTextColumn(
      'phrase_titile',
      $tableName,
      true,
    );
  }

  final VerificationMeta _phraseDetailMeta =
      const VerificationMeta('phraseDetail');
  GeneratedTextColumn _phraseDetail;
  @override
  GeneratedTextColumn get phraseDetail =>
      _phraseDetail ??= _constructPhraseDetail();
  GeneratedTextColumn _constructPhraseDetail() {
    return GeneratedTextColumn(
      'phrase_detail',
      $tableName,
      true,
    );
  }

  final VerificationMeta _phraseTagMeta = const VerificationMeta('phraseTag');
  GeneratedTextColumn _phraseTag;
  @override
  GeneratedTextColumn get phraseTag => _phraseTag ??= _constructPhraseTag();
  GeneratedTextColumn _constructPhraseTag() {
    return GeneratedTextColumn(
      'phrase_tag',
      $tableName,
      true,
    );
  }

  final VerificationMeta _phraseLinkMeta = const VerificationMeta('phraseLink');
  GeneratedTextColumn _phraseLink;
  @override
  GeneratedTextColumn get phraseLink => _phraseLink ??= _constructPhraseLink();
  GeneratedTextColumn _constructPhraseLink() {
    return GeneratedTextColumn(
      'phrase_link',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, phraseTitile, phraseDetail, phraseTag, phraseLink];
  @override
  $PhrasesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'phrases';
  @override
  final String actualTableName = 'phrases';
  @override
  VerificationContext validateIntegrity(Insertable<Phrase> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('phrase_titile')) {
      context.handle(
          _phraseTitileMeta,
          phraseTitile.isAcceptableOrUnknown(
              data['phrase_titile'], _phraseTitileMeta));
    }
    if (data.containsKey('phrase_detail')) {
      context.handle(
          _phraseDetailMeta,
          phraseDetail.isAcceptableOrUnknown(
              data['phrase_detail'], _phraseDetailMeta));
    }
    if (data.containsKey('phrase_tag')) {
      context.handle(_phraseTagMeta,
          phraseTag.isAcceptableOrUnknown(data['phrase_tag'], _phraseTagMeta));
    }
    if (data.containsKey('phrase_link')) {
      context.handle(
          _phraseLinkMeta,
          phraseLink.isAcceptableOrUnknown(
              data['phrase_link'], _phraseLinkMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Phrase map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Phrase.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $PhrasesTable createAlias(String alias) {
    return $PhrasesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $QuotesTable _quotes;
  $QuotesTable get quotes => _quotes ??= $QuotesTable(this);
  $PhrasesTable _phrases;
  $PhrasesTable get phrases => _phrases ??= $PhrasesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [quotes, phrases];
}
