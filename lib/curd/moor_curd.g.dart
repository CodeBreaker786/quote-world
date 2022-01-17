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
    return Quote(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      quoteContent: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}quote_content']),
      quoteTag: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}quote_tag']),
      quoteImageUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}quote_image_url']),
      quoteWriter: const StringType()
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
  bool operator ==(Object other) =>
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
  GeneratedColumn<int> _id;
  @override
  GeneratedColumn<int> get id =>
      _id ??= GeneratedColumn<int>('id', aliasedName, false,
          typeName: 'INTEGER',
          requiredDuringInsert: false,
          defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _quoteContentMeta =
      const VerificationMeta('quoteContent');
  GeneratedColumn<String> _quoteContent;
  @override
  GeneratedColumn<String> get quoteContent => _quoteContent ??=
      GeneratedColumn<String>('quote_content', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _quoteTagMeta = const VerificationMeta('quoteTag');
  GeneratedColumn<String> _quoteTag;
  @override
  GeneratedColumn<String> get quoteTag =>
      _quoteTag ??= GeneratedColumn<String>('quote_tag', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _quoteImageUrlMeta =
      const VerificationMeta('quoteImageUrl');
  GeneratedColumn<String> _quoteImageUrl;
  @override
  GeneratedColumn<String> get quoteImageUrl => _quoteImageUrl ??=
      GeneratedColumn<String>('quote_image_url', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _quoteWriterMeta =
      const VerificationMeta('quoteWriter');
  GeneratedColumn<String> _quoteWriter;
  @override
  GeneratedColumn<String> get quoteWriter => _quoteWriter ??=
      GeneratedColumn<String>('quote_writer', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, quoteContent, quoteTag, quoteImageUrl, quoteWriter];
  @override
  String get aliasedName => _alias ?? 'quotes';
  @override
  String get actualTableName => 'quotes';
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
    return Quote.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
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
    return Phrase(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      phraseTitile: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}phrase_titile']),
      phraseDetail: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}phrase_detail']),
      phraseTag: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}phrase_tag']),
      phraseLink: const StringType()
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
  bool operator ==(Object other) =>
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
  GeneratedColumn<int> _id;
  @override
  GeneratedColumn<int> get id =>
      _id ??= GeneratedColumn<int>('id', aliasedName, false,
          typeName: 'INTEGER',
          requiredDuringInsert: false,
          defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _phraseTitileMeta =
      const VerificationMeta('phraseTitile');
  GeneratedColumn<String> _phraseTitile;
  @override
  GeneratedColumn<String> get phraseTitile => _phraseTitile ??=
      GeneratedColumn<String>('phrase_titile', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _phraseDetailMeta =
      const VerificationMeta('phraseDetail');
  GeneratedColumn<String> _phraseDetail;
  @override
  GeneratedColumn<String> get phraseDetail => _phraseDetail ??=
      GeneratedColumn<String>('phrase_detail', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _phraseTagMeta = const VerificationMeta('phraseTag');
  GeneratedColumn<String> _phraseTag;
  @override
  GeneratedColumn<String> get phraseTag =>
      _phraseTag ??= GeneratedColumn<String>('phrase_tag', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _phraseLinkMeta = const VerificationMeta('phraseLink');
  GeneratedColumn<String> _phraseLink;
  @override
  GeneratedColumn<String> get phraseLink =>
      _phraseLink ??= GeneratedColumn<String>('phrase_link', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, phraseTitile, phraseDetail, phraseTag, phraseLink];
  @override
  String get aliasedName => _alias ?? 'phrases';
  @override
  String get actualTableName => 'phrases';
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
    return Phrase.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PhrasesTable createAlias(String alias) {
    return $PhrasesTable(_db, alias);
  }
}

class Idiom extends DataClass implements Insertable<Idiom> {
  final int id;
  final String idiom;
  final String idiomMeaningLink;
  Idiom({@required this.id, this.idiom, this.idiomMeaningLink});
  factory Idiom.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    return Idiom(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      idiom: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}idiom']),
      idiomMeaningLink: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}idiom_meaning_link']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || idiom != null) {
      map['idiom'] = Variable<String>(idiom);
    }
    if (!nullToAbsent || idiomMeaningLink != null) {
      map['idiom_meaning_link'] = Variable<String>(idiomMeaningLink);
    }
    return map;
  }

  IdiomsCompanion toCompanion(bool nullToAbsent) {
    return IdiomsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      idiom:
          idiom == null && nullToAbsent ? const Value.absent() : Value(idiom),
      idiomMeaningLink: idiomMeaningLink == null && nullToAbsent
          ? const Value.absent()
          : Value(idiomMeaningLink),
    );
  }

  factory Idiom.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Idiom(
      id: serializer.fromJson<int>(json['id']),
      idiom: serializer.fromJson<String>(json['idiom']),
      idiomMeaningLink: serializer.fromJson<String>(json['idiomMeaningLink']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idiom': serializer.toJson<String>(idiom),
      'idiomMeaningLink': serializer.toJson<String>(idiomMeaningLink),
    };
  }

  Idiom copyWith({int id, String idiom, String idiomMeaningLink}) => Idiom(
        id: id ?? this.id,
        idiom: idiom ?? this.idiom,
        idiomMeaningLink: idiomMeaningLink ?? this.idiomMeaningLink,
      );
  @override
  String toString() {
    return (StringBuffer('Idiom(')
          ..write('id: $id, ')
          ..write('idiom: $idiom, ')
          ..write('idiomMeaningLink: $idiomMeaningLink')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(
      $mrjc(id.hashCode, $mrjc(idiom.hashCode, idiomMeaningLink.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Idiom &&
          other.id == this.id &&
          other.idiom == this.idiom &&
          other.idiomMeaningLink == this.idiomMeaningLink);
}

class IdiomsCompanion extends UpdateCompanion<Idiom> {
  final Value<int> id;
  final Value<String> idiom;
  final Value<String> idiomMeaningLink;
  const IdiomsCompanion({
    this.id = const Value.absent(),
    this.idiom = const Value.absent(),
    this.idiomMeaningLink = const Value.absent(),
  });
  IdiomsCompanion.insert({
    this.id = const Value.absent(),
    this.idiom = const Value.absent(),
    this.idiomMeaningLink = const Value.absent(),
  });
  static Insertable<Idiom> custom({
    Expression<int> id,
    Expression<String> idiom,
    Expression<String> idiomMeaningLink,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idiom != null) 'idiom': idiom,
      if (idiomMeaningLink != null) 'idiom_meaning_link': idiomMeaningLink,
    });
  }

  IdiomsCompanion copyWith(
      {Value<int> id, Value<String> idiom, Value<String> idiomMeaningLink}) {
    return IdiomsCompanion(
      id: id ?? this.id,
      idiom: idiom ?? this.idiom,
      idiomMeaningLink: idiomMeaningLink ?? this.idiomMeaningLink,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idiom.present) {
      map['idiom'] = Variable<String>(idiom.value);
    }
    if (idiomMeaningLink.present) {
      map['idiom_meaning_link'] = Variable<String>(idiomMeaningLink.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IdiomsCompanion(')
          ..write('id: $id, ')
          ..write('idiom: $idiom, ')
          ..write('idiomMeaningLink: $idiomMeaningLink')
          ..write(')'))
        .toString();
  }
}

class $IdiomsTable extends Idioms with TableInfo<$IdiomsTable, Idiom> {
  final GeneratedDatabase _db;
  final String _alias;
  $IdiomsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedColumn<int> _id;
  @override
  GeneratedColumn<int> get id =>
      _id ??= GeneratedColumn<int>('id', aliasedName, false,
          typeName: 'INTEGER',
          requiredDuringInsert: false,
          defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _idiomMeta = const VerificationMeta('idiom');
  GeneratedColumn<String> _idiom;
  @override
  GeneratedColumn<String> get idiom =>
      _idiom ??= GeneratedColumn<String>('idiom', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _idiomMeaningLinkMeta =
      const VerificationMeta('idiomMeaningLink');
  GeneratedColumn<String> _idiomMeaningLink;
  @override
  GeneratedColumn<String> get idiomMeaningLink => _idiomMeaningLink ??=
      GeneratedColumn<String>('idiom_meaning_link', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, idiom, idiomMeaningLink];
  @override
  String get aliasedName => _alias ?? 'idioms';
  @override
  String get actualTableName => 'idioms';
  @override
  VerificationContext validateIntegrity(Insertable<Idiom> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('idiom')) {
      context.handle(
          _idiomMeta, idiom.isAcceptableOrUnknown(data['idiom'], _idiomMeta));
    }
    if (data.containsKey('idiom_meaning_link')) {
      context.handle(
          _idiomMeaningLinkMeta,
          idiomMeaningLink.isAcceptableOrUnknown(
              data['idiom_meaning_link'], _idiomMeaningLinkMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Idiom map(Map<String, dynamic> data, {String tablePrefix}) {
    return Idiom.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $IdiomsTable createAlias(String alias) {
    return $IdiomsTable(_db, alias);
  }
}

class LastWord extends DataClass implements Insertable<LastWord> {
  final int id;
  final String name;
  final String lastWords;
  final String imageLink;
  final String lastWordsReceiver;
  final String deathAndBirthDates;
  LastWord(
      {@required this.id,
      this.name,
      this.lastWords,
      this.imageLink,
      this.lastWordsReceiver,
      this.deathAndBirthDates});
  factory LastWord.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    return LastWord(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
      lastWords: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_words']),
      imageLink: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image_link']),
      lastWordsReceiver: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}last_words_receiver']),
      deathAndBirthDates: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}death_and_birth_dates']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || lastWords != null) {
      map['last_words'] = Variable<String>(lastWords);
    }
    if (!nullToAbsent || imageLink != null) {
      map['image_link'] = Variable<String>(imageLink);
    }
    if (!nullToAbsent || lastWordsReceiver != null) {
      map['last_words_receiver'] = Variable<String>(lastWordsReceiver);
    }
    if (!nullToAbsent || deathAndBirthDates != null) {
      map['death_and_birth_dates'] = Variable<String>(deathAndBirthDates);
    }
    return map;
  }

  LastWordsCompanion toCompanion(bool nullToAbsent) {
    return LastWordsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      lastWords: lastWords == null && nullToAbsent
          ? const Value.absent()
          : Value(lastWords),
      imageLink: imageLink == null && nullToAbsent
          ? const Value.absent()
          : Value(imageLink),
      lastWordsReceiver: lastWordsReceiver == null && nullToAbsent
          ? const Value.absent()
          : Value(lastWordsReceiver),
      deathAndBirthDates: deathAndBirthDates == null && nullToAbsent
          ? const Value.absent()
          : Value(deathAndBirthDates),
    );
  }

  factory LastWord.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return LastWord(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      lastWords: serializer.fromJson<String>(json['lastWords']),
      imageLink: serializer.fromJson<String>(json['imageLink']),
      lastWordsReceiver: serializer.fromJson<String>(json['lastWordsReceiver']),
      deathAndBirthDates:
          serializer.fromJson<String>(json['deathAndBirthDates']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'lastWords': serializer.toJson<String>(lastWords),
      'imageLink': serializer.toJson<String>(imageLink),
      'lastWordsReceiver': serializer.toJson<String>(lastWordsReceiver),
      'deathAndBirthDates': serializer.toJson<String>(deathAndBirthDates),
    };
  }

  LastWord copyWith(
          {int id,
          String name,
          String lastWords,
          String imageLink,
          String lastWordsReceiver,
          String deathAndBirthDates}) =>
      LastWord(
        id: id ?? this.id,
        name: name ?? this.name,
        lastWords: lastWords ?? this.lastWords,
        imageLink: imageLink ?? this.imageLink,
        lastWordsReceiver: lastWordsReceiver ?? this.lastWordsReceiver,
        deathAndBirthDates: deathAndBirthDates ?? this.deathAndBirthDates,
      );
  @override
  String toString() {
    return (StringBuffer('LastWord(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lastWords: $lastWords, ')
          ..write('imageLink: $imageLink, ')
          ..write('lastWordsReceiver: $lastWordsReceiver, ')
          ..write('deathAndBirthDates: $deathAndBirthDates')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              lastWords.hashCode,
              $mrjc(
                  imageLink.hashCode,
                  $mrjc(lastWordsReceiver.hashCode,
                      deathAndBirthDates.hashCode))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LastWord &&
          other.id == this.id &&
          other.name == this.name &&
          other.lastWords == this.lastWords &&
          other.imageLink == this.imageLink &&
          other.lastWordsReceiver == this.lastWordsReceiver &&
          other.deathAndBirthDates == this.deathAndBirthDates);
}

class LastWordsCompanion extends UpdateCompanion<LastWord> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> lastWords;
  final Value<String> imageLink;
  final Value<String> lastWordsReceiver;
  final Value<String> deathAndBirthDates;
  const LastWordsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.lastWords = const Value.absent(),
    this.imageLink = const Value.absent(),
    this.lastWordsReceiver = const Value.absent(),
    this.deathAndBirthDates = const Value.absent(),
  });
  LastWordsCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.lastWords = const Value.absent(),
    this.imageLink = const Value.absent(),
    this.lastWordsReceiver = const Value.absent(),
    this.deathAndBirthDates = const Value.absent(),
  });
  static Insertable<LastWord> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<String> lastWords,
    Expression<String> imageLink,
    Expression<String> lastWordsReceiver,
    Expression<String> deathAndBirthDates,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (lastWords != null) 'last_words': lastWords,
      if (imageLink != null) 'image_link': imageLink,
      if (lastWordsReceiver != null) 'last_words_receiver': lastWordsReceiver,
      if (deathAndBirthDates != null)
        'death_and_birth_dates': deathAndBirthDates,
    });
  }

  LastWordsCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> lastWords,
      Value<String> imageLink,
      Value<String> lastWordsReceiver,
      Value<String> deathAndBirthDates}) {
    return LastWordsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      lastWords: lastWords ?? this.lastWords,
      imageLink: imageLink ?? this.imageLink,
      lastWordsReceiver: lastWordsReceiver ?? this.lastWordsReceiver,
      deathAndBirthDates: deathAndBirthDates ?? this.deathAndBirthDates,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (lastWords.present) {
      map['last_words'] = Variable<String>(lastWords.value);
    }
    if (imageLink.present) {
      map['image_link'] = Variable<String>(imageLink.value);
    }
    if (lastWordsReceiver.present) {
      map['last_words_receiver'] = Variable<String>(lastWordsReceiver.value);
    }
    if (deathAndBirthDates.present) {
      map['death_and_birth_dates'] = Variable<String>(deathAndBirthDates.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LastWordsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lastWords: $lastWords, ')
          ..write('imageLink: $imageLink, ')
          ..write('lastWordsReceiver: $lastWordsReceiver, ')
          ..write('deathAndBirthDates: $deathAndBirthDates')
          ..write(')'))
        .toString();
  }
}

class $LastWordsTable extends LastWords
    with TableInfo<$LastWordsTable, LastWord> {
  final GeneratedDatabase _db;
  final String _alias;
  $LastWordsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedColumn<int> _id;
  @override
  GeneratedColumn<int> get id =>
      _id ??= GeneratedColumn<int>('id', aliasedName, false,
          typeName: 'INTEGER',
          requiredDuringInsert: false,
          defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedColumn<String> _name;
  @override
  GeneratedColumn<String> get name =>
      _name ??= GeneratedColumn<String>('name', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _lastWordsMeta = const VerificationMeta('lastWords');
  GeneratedColumn<String> _lastWords;
  @override
  GeneratedColumn<String> get lastWords =>
      _lastWords ??= GeneratedColumn<String>('last_words', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _imageLinkMeta = const VerificationMeta('imageLink');
  GeneratedColumn<String> _imageLink;
  @override
  GeneratedColumn<String> get imageLink =>
      _imageLink ??= GeneratedColumn<String>('image_link', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _lastWordsReceiverMeta =
      const VerificationMeta('lastWordsReceiver');
  GeneratedColumn<String> _lastWordsReceiver;
  @override
  GeneratedColumn<String> get lastWordsReceiver => _lastWordsReceiver ??=
      GeneratedColumn<String>('last_words_receiver', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _deathAndBirthDatesMeta =
      const VerificationMeta('deathAndBirthDates');
  GeneratedColumn<String> _deathAndBirthDates;
  @override
  GeneratedColumn<String> get deathAndBirthDates => _deathAndBirthDates ??=
      GeneratedColumn<String>('death_and_birth_dates', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, lastWords, imageLink, lastWordsReceiver, deathAndBirthDates];
  @override
  String get aliasedName => _alias ?? 'last_words';
  @override
  String get actualTableName => 'last_words';
  @override
  VerificationContext validateIntegrity(Insertable<LastWord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    }
    if (data.containsKey('last_words')) {
      context.handle(_lastWordsMeta,
          lastWords.isAcceptableOrUnknown(data['last_words'], _lastWordsMeta));
    }
    if (data.containsKey('image_link')) {
      context.handle(_imageLinkMeta,
          imageLink.isAcceptableOrUnknown(data['image_link'], _imageLinkMeta));
    }
    if (data.containsKey('last_words_receiver')) {
      context.handle(
          _lastWordsReceiverMeta,
          lastWordsReceiver.isAcceptableOrUnknown(
              data['last_words_receiver'], _lastWordsReceiverMeta));
    }
    if (data.containsKey('death_and_birth_dates')) {
      context.handle(
          _deathAndBirthDatesMeta,
          deathAndBirthDates.isAcceptableOrUnknown(
              data['death_and_birth_dates'], _deathAndBirthDatesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LastWord map(Map<String, dynamic> data, {String tablePrefix}) {
    return LastWord.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $LastWordsTable createAlias(String alias) {
    return $LastWordsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $QuotesTable _quotes;
  $QuotesTable get quotes => _quotes ??= $QuotesTable(this);
  $PhrasesTable _phrases;
  $PhrasesTable get phrases => _phrases ??= $PhrasesTable(this);
  $IdiomsTable _idioms;
  $IdiomsTable get idioms => _idioms ??= $IdiomsTable(this);
  $LastWordsTable _lastWords;
  $LastWordsTable get lastWords => _lastWords ??= $LastWordsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [quotes, phrases, idioms, lastWords];
}
