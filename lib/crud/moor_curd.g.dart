// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_curd.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Item extends DataClass implements Insertable<Item> {
  final int? id;
  final String? content;
  final String? att1;
  final String? att2;
  final String? att3;
  final String? imageUrl;
  final String? type;
  final String quoteWriter;
  Item(
      {this.id,
      this.content,
      this.att1,
      this.att2,
      this.att3,
      this.imageUrl,
      this.type,
      required this.quoteWriter});
  factory Item.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Item(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      content: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}content']),
      att1: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}att1']),
      att2: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}att2']),
      att3: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}att3']),
      imageUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image_url']),
      type: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type']),
      quoteWriter: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}quote_writer'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String?>(content);
    }
    if (!nullToAbsent || att1 != null) {
      map['att1'] = Variable<String?>(att1);
    }
    if (!nullToAbsent || att2 != null) {
      map['att2'] = Variable<String?>(att2);
    }
    if (!nullToAbsent || att3 != null) {
      map['att3'] = Variable<String?>(att3);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String?>(imageUrl);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String?>(type);
    }
    map['quote_writer'] = Variable<String>(quoteWriter);
    return map;
  }

  ItemsCompanion toCompanion(bool nullToAbsent) {
    return ItemsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      att1: att1 == null && nullToAbsent ? const Value.absent() : Value(att1),
      att2: att2 == null && nullToAbsent ? const Value.absent() : Value(att2),
      att3: att3 == null && nullToAbsent ? const Value.absent() : Value(att3),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      quoteWriter: Value(quoteWriter),
    );
  }

  factory Item.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Item(
      id: serializer.fromJson<int?>(json['id']),
      content: serializer.fromJson<String?>(json['content']),
      att1: serializer.fromJson<String?>(json['att1']),
      att2: serializer.fromJson<String?>(json['att2']),
      att3: serializer.fromJson<String?>(json['att3']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      type: serializer.fromJson<String?>(json['type']),
      quoteWriter: serializer.fromJson<String>(json['quoteWriter']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'content': serializer.toJson<String?>(content),
      'att1': serializer.toJson<String?>(att1),
      'att2': serializer.toJson<String?>(att2),
      'att3': serializer.toJson<String?>(att3),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'type': serializer.toJson<String?>(type),
      'quoteWriter': serializer.toJson<String>(quoteWriter),
    };
  }

  Item copyWith(
          {int? id,
          String? content,
          String? att1,
          String? att2,
          String? att3,
          String? imageUrl,
          String? type,
          String? quoteWriter}) =>
      Item(
        id: id ?? this.id,
        content: content ?? this.content,
        att1: att1 ?? this.att1,
        att2: att2 ?? this.att2,
        att3: att3 ?? this.att3,
        imageUrl: imageUrl ?? this.imageUrl,
        type: type ?? this.type,
        quoteWriter: quoteWriter ?? this.quoteWriter,
      );
  @override
  String toString() {
    return (StringBuffer('Item(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('att1: $att1, ')
          ..write('att2: $att2, ')
          ..write('att3: $att3, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('type: $type, ')
          ..write('quoteWriter: $quoteWriter')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, content, att1, att2, att3, imageUrl, type, quoteWriter);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Item &&
          other.id == this.id &&
          other.content == this.content &&
          other.att1 == this.att1 &&
          other.att2 == this.att2 &&
          other.att3 == this.att3 &&
          other.imageUrl == this.imageUrl &&
          other.type == this.type &&
          other.quoteWriter == this.quoteWriter);
}

class ItemsCompanion extends UpdateCompanion<Item> {
  final Value<int?> id;
  final Value<String?> content;
  final Value<String?> att1;
  final Value<String?> att2;
  final Value<String?> att3;
  final Value<String?> imageUrl;
  final Value<String?> type;
  final Value<String> quoteWriter;
  const ItemsCompanion({
    this.id = const Value.absent(),
    this.content = const Value.absent(),
    this.att1 = const Value.absent(),
    this.att2 = const Value.absent(),
    this.att3 = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.type = const Value.absent(),
    this.quoteWriter = const Value.absent(),
  });
  ItemsCompanion.insert({
    this.id = const Value.absent(),
    this.content = const Value.absent(),
    this.att1 = const Value.absent(),
    this.att2 = const Value.absent(),
    this.att3 = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.type = const Value.absent(),
    required String quoteWriter,
  }) : quoteWriter = Value(quoteWriter);
  static Insertable<Item> custom({
    Expression<int?>? id,
    Expression<String?>? content,
    Expression<String?>? att1,
    Expression<String?>? att2,
    Expression<String?>? att3,
    Expression<String?>? imageUrl,
    Expression<String?>? type,
    Expression<String>? quoteWriter,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (content != null) 'content': content,
      if (att1 != null) 'att1': att1,
      if (att2 != null) 'att2': att2,
      if (att3 != null) 'att3': att3,
      if (imageUrl != null) 'image_url': imageUrl,
      if (type != null) 'type': type,
      if (quoteWriter != null) 'quote_writer': quoteWriter,
    });
  }

  ItemsCompanion copyWith(
      {Value<int?>? id,
      Value<String?>? content,
      Value<String?>? att1,
      Value<String?>? att2,
      Value<String?>? att3,
      Value<String?>? imageUrl,
      Value<String?>? type,
      Value<String>? quoteWriter}) {
    return ItemsCompanion(
      id: id ?? this.id,
      content: content ?? this.content,
      att1: att1 ?? this.att1,
      att2: att2 ?? this.att2,
      att3: att3 ?? this.att3,
      imageUrl: imageUrl ?? this.imageUrl,
      type: type ?? this.type,
      quoteWriter: quoteWriter ?? this.quoteWriter,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (content.present) {
      map['content'] = Variable<String?>(content.value);
    }
    if (att1.present) {
      map['att1'] = Variable<String?>(att1.value);
    }
    if (att2.present) {
      map['att2'] = Variable<String?>(att2.value);
    }
    if (att3.present) {
      map['att3'] = Variable<String?>(att3.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String?>(imageUrl.value);
    }
    if (type.present) {
      map['type'] = Variable<String?>(type.value);
    }
    if (quoteWriter.present) {
      map['quote_writer'] = Variable<String>(quoteWriter.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemsCompanion(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('att1: $att1, ')
          ..write('att2: $att2, ')
          ..write('att3: $att3, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('type: $type, ')
          ..write('quoteWriter: $quoteWriter')
          ..write(')'))
        .toString();
  }
}

class $ItemsTable extends Items with TableInfo<$ItemsTable, Item> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedColumn<String?> content = GeneratedColumn<String?>(
      'content', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _att1Meta = const VerificationMeta('att1');
  @override
  late final GeneratedColumn<String?> att1 = GeneratedColumn<String?>(
      'att1', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _att2Meta = const VerificationMeta('att2');
  @override
  late final GeneratedColumn<String?> att2 = GeneratedColumn<String?>(
      'att2', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _att3Meta = const VerificationMeta('att3');
  @override
  late final GeneratedColumn<String?> att3 = GeneratedColumn<String?>(
      'att3', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _imageUrlMeta = const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String?> imageUrl = GeneratedColumn<String?>(
      'image_url', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String?> type = GeneratedColumn<String?>(
      'type', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _quoteWriterMeta =
      const VerificationMeta('quoteWriter');
  @override
  late final GeneratedColumn<String?> quoteWriter = GeneratedColumn<String?>(
      'quote_writer', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, content, att1, att2, att3, imageUrl, type, quoteWriter];
  @override
  String get aliasedName => _alias ?? 'items';
  @override
  String get actualTableName => 'items';
  @override
  VerificationContext validateIntegrity(Insertable<Item> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    }
    if (data.containsKey('att1')) {
      context.handle(
          _att1Meta, att1.isAcceptableOrUnknown(data['att1']!, _att1Meta));
    }
    if (data.containsKey('att2')) {
      context.handle(
          _att2Meta, att2.isAcceptableOrUnknown(data['att2']!, _att2Meta));
    }
    if (data.containsKey('att3')) {
      context.handle(
          _att3Meta, att3.isAcceptableOrUnknown(data['att3']!, _att3Meta));
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    if (data.containsKey('quote_writer')) {
      context.handle(
          _quoteWriterMeta,
          quoteWriter.isAcceptableOrUnknown(
              data['quote_writer']!, _quoteWriterMeta));
    } else if (isInserting) {
      context.missing(_quoteWriterMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Item map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Item.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ItemsTable createAlias(String alias) {
    return $ItemsTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ItemsTable items = $ItemsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [items];
}
