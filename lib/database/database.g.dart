// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Meas extends DataClass implements Insertable<Meas> {
  final int guid;
  final String name;
  Meas({required this.guid, required this.name});
  factory Meas.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Meas(
      guid: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}guid'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['guid'] = Variable<int>(guid);
    map['name'] = Variable<String>(name);
    return map;
  }

  MeasesCompanion toCompanion(bool nullToAbsent) {
    return MeasesCompanion(
      guid: Value(guid),
      name: Value(name),
    );
  }

  factory Meas.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Meas(
      guid: serializer.fromJson<int>(json['guid']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'guid': serializer.toJson<int>(guid),
      'name': serializer.toJson<String>(name),
    };
  }

  Meas copyWith({int? guid, String? name}) => Meas(
        guid: guid ?? this.guid,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Meas(')
          ..write('guid: $guid, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(guid, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Meas && other.guid == this.guid && other.name == this.name);
}

class MeasesCompanion extends UpdateCompanion<Meas> {
  final Value<int> guid;
  final Value<String> name;
  const MeasesCompanion({
    this.guid = const Value.absent(),
    this.name = const Value.absent(),
  });
  MeasesCompanion.insert({
    this.guid = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Meas> custom({
    Expression<int>? guid,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (guid != null) 'guid': guid,
      if (name != null) 'name': name,
    });
  }

  MeasesCompanion copyWith({Value<int>? guid, Value<String>? name}) {
    return MeasesCompanion(
      guid: guid ?? this.guid,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (guid.present) {
      map['guid'] = Variable<int>(guid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MeasesCompanion(')
          ..write('guid: $guid, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $MeasesTable extends Meases with TableInfo<$MeasesTable, Meas> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MeasesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _guidMeta = const VerificationMeta('guid');
  @override
  late final GeneratedColumn<int?> guid = GeneratedColumn<int?>(
      'guid', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      type: const StringType(),
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [guid, name];
  @override
  String get aliasedName => _alias ?? 'meases';
  @override
  String get actualTableName => 'meases';
  @override
  VerificationContext validateIntegrity(Insertable<Meas> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('guid')) {
      context.handle(
          _guidMeta, guid.isAcceptableOrUnknown(data['guid']!, _guidMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {guid};
  @override
  Meas map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Meas.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MeasesTable createAlias(String alias) {
    return $MeasesTable(attachedDatabase, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  final int guid;
  final bool is_deleted;
  final String code;
  final String name;
  final double nds;
  final int? meas_guid;
  final int count;
  final bool is_weight;
  final double price;
  Product(
      {required this.guid,
      required this.is_deleted,
      required this.code,
      required this.name,
      required this.nds,
      this.meas_guid,
      required this.count,
      required this.is_weight,
      required this.price});
  factory Product.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Product(
      guid: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}guid'])!,
      is_deleted: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_deleted'])!,
      code: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}code'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      nds: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nds'])!,
      meas_guid: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}meas_guid']),
      count: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}count'])!,
      is_weight: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_weight'])!,
      price: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}price'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['guid'] = Variable<int>(guid);
    map['is_deleted'] = Variable<bool>(is_deleted);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    map['nds'] = Variable<double>(nds);
    if (!nullToAbsent || meas_guid != null) {
      map['meas_guid'] = Variable<int?>(meas_guid);
    }
    map['count'] = Variable<int>(count);
    map['is_weight'] = Variable<bool>(is_weight);
    map['price'] = Variable<double>(price);
    return map;
  }

  GoodsCompanion toCompanion(bool nullToAbsent) {
    return GoodsCompanion(
      guid: Value(guid),
      is_deleted: Value(is_deleted),
      code: Value(code),
      name: Value(name),
      nds: Value(nds),
      meas_guid: meas_guid == null && nullToAbsent
          ? const Value.absent()
          : Value(meas_guid),
      count: Value(count),
      is_weight: Value(is_weight),
      price: Value(price),
    );
  }

  factory Product.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      guid: serializer.fromJson<int>(json['guid']),
      is_deleted: serializer.fromJson<bool>(json['is_deleted']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      nds: serializer.fromJson<double>(json['nds']),
      meas_guid: serializer.fromJson<int?>(json['meas_guid']),
      count: serializer.fromJson<int>(json['count']),
      is_weight: serializer.fromJson<bool>(json['is_weight']),
      price: serializer.fromJson<double>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'guid': serializer.toJson<int>(guid),
      'is_deleted': serializer.toJson<bool>(is_deleted),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'nds': serializer.toJson<double>(nds),
      'meas_guid': serializer.toJson<int?>(meas_guid),
      'count': serializer.toJson<int>(count),
      'is_weight': serializer.toJson<bool>(is_weight),
      'price': serializer.toJson<double>(price),
    };
  }

  Product copyWith(
          {int? guid,
          bool? is_deleted,
          String? code,
          String? name,
          double? nds,
          int? meas_guid,
          int? count,
          bool? is_weight,
          double? price}) =>
      Product(
        guid: guid ?? this.guid,
        is_deleted: is_deleted ?? this.is_deleted,
        code: code ?? this.code,
        name: name ?? this.name,
        nds: nds ?? this.nds,
        meas_guid: meas_guid ?? this.meas_guid,
        count: count ?? this.count,
        is_weight: is_weight ?? this.is_weight,
        price: price ?? this.price,
      );
  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('guid: $guid, ')
          ..write('is_deleted: $is_deleted, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('nds: $nds, ')
          ..write('meas_guid: $meas_guid, ')
          ..write('count: $count, ')
          ..write('is_weight: $is_weight, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      guid, is_deleted, code, name, nds, meas_guid, count, is_weight, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.guid == this.guid &&
          other.is_deleted == this.is_deleted &&
          other.code == this.code &&
          other.name == this.name &&
          other.nds == this.nds &&
          other.meas_guid == this.meas_guid &&
          other.count == this.count &&
          other.is_weight == this.is_weight &&
          other.price == this.price);
}

class GoodsCompanion extends UpdateCompanion<Product> {
  final Value<int> guid;
  final Value<bool> is_deleted;
  final Value<String> code;
  final Value<String> name;
  final Value<double> nds;
  final Value<int?> meas_guid;
  final Value<int> count;
  final Value<bool> is_weight;
  final Value<double> price;
  const GoodsCompanion({
    this.guid = const Value.absent(),
    this.is_deleted = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.nds = const Value.absent(),
    this.meas_guid = const Value.absent(),
    this.count = const Value.absent(),
    this.is_weight = const Value.absent(),
    this.price = const Value.absent(),
  });
  GoodsCompanion.insert({
    this.guid = const Value.absent(),
    this.is_deleted = const Value.absent(),
    required String code,
    required String name,
    this.nds = const Value.absent(),
    this.meas_guid = const Value.absent(),
    this.count = const Value.absent(),
    this.is_weight = const Value.absent(),
    required double price,
  })  : code = Value(code),
        name = Value(name),
        price = Value(price);
  static Insertable<Product> custom({
    Expression<int>? guid,
    Expression<bool>? is_deleted,
    Expression<String>? code,
    Expression<String>? name,
    Expression<double>? nds,
    Expression<int?>? meas_guid,
    Expression<int>? count,
    Expression<bool>? is_weight,
    Expression<double>? price,
  }) {
    return RawValuesInsertable({
      if (guid != null) 'guid': guid,
      if (is_deleted != null) 'is_deleted': is_deleted,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (nds != null) 'nds': nds,
      if (meas_guid != null) 'meas_guid': meas_guid,
      if (count != null) 'count': count,
      if (is_weight != null) 'is_weight': is_weight,
      if (price != null) 'price': price,
    });
  }

  GoodsCompanion copyWith(
      {Value<int>? guid,
      Value<bool>? is_deleted,
      Value<String>? code,
      Value<String>? name,
      Value<double>? nds,
      Value<int?>? meas_guid,
      Value<int>? count,
      Value<bool>? is_weight,
      Value<double>? price}) {
    return GoodsCompanion(
      guid: guid ?? this.guid,
      is_deleted: is_deleted ?? this.is_deleted,
      code: code ?? this.code,
      name: name ?? this.name,
      nds: nds ?? this.nds,
      meas_guid: meas_guid ?? this.meas_guid,
      count: count ?? this.count,
      is_weight: is_weight ?? this.is_weight,
      price: price ?? this.price,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (guid.present) {
      map['guid'] = Variable<int>(guid.value);
    }
    if (is_deleted.present) {
      map['is_deleted'] = Variable<bool>(is_deleted.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nds.present) {
      map['nds'] = Variable<double>(nds.value);
    }
    if (meas_guid.present) {
      map['meas_guid'] = Variable<int?>(meas_guid.value);
    }
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    if (is_weight.present) {
      map['is_weight'] = Variable<bool>(is_weight.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoodsCompanion(')
          ..write('guid: $guid, ')
          ..write('is_deleted: $is_deleted, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('nds: $nds, ')
          ..write('meas_guid: $meas_guid, ')
          ..write('count: $count, ')
          ..write('is_weight: $is_weight, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }
}

class $GoodsTable extends Goods with TableInfo<$GoodsTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoodsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _guidMeta = const VerificationMeta('guid');
  @override
  late final GeneratedColumn<int?> guid = GeneratedColumn<int?>(
      'guid', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _is_deletedMeta = const VerificationMeta('is_deleted');
  @override
  late final GeneratedColumn<bool?> is_deleted = GeneratedColumn<bool?>(
      'is_deleted', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_deleted IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String?> code = GeneratedColumn<String?>(
      'code', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 200),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _ndsMeta = const VerificationMeta('nds');
  @override
  late final GeneratedColumn<double?> nds = GeneratedColumn<double?>(
      'nds', aliasedName, false,
      type: const RealType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _meas_guidMeta = const VerificationMeta('meas_guid');
  @override
  late final GeneratedColumn<int?> meas_guid = GeneratedColumn<int?>(
      'meas_guid', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'REFERENCES meases (guid)');
  final VerificationMeta _countMeta = const VerificationMeta('count');
  @override
  late final GeneratedColumn<int?> count = GeneratedColumn<int?>(
      'count', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _is_weightMeta = const VerificationMeta('is_weight');
  @override
  late final GeneratedColumn<bool?> is_weight = GeneratedColumn<bool?>(
      'is_weight', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_weight IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double?> price = GeneratedColumn<double?>(
      'price', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [guid, is_deleted, code, name, nds, meas_guid, count, is_weight, price];
  @override
  String get aliasedName => _alias ?? 'goods';
  @override
  String get actualTableName => 'goods';
  @override
  VerificationContext validateIntegrity(Insertable<Product> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('guid')) {
      context.handle(
          _guidMeta, guid.isAcceptableOrUnknown(data['guid']!, _guidMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
          _is_deletedMeta,
          is_deleted.isAcceptableOrUnknown(
              data['is_deleted']!, _is_deletedMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('nds')) {
      context.handle(
          _ndsMeta, nds.isAcceptableOrUnknown(data['nds']!, _ndsMeta));
    }
    if (data.containsKey('meas_guid')) {
      context.handle(_meas_guidMeta,
          meas_guid.isAcceptableOrUnknown(data['meas_guid']!, _meas_guidMeta));
    }
    if (data.containsKey('count')) {
      context.handle(
          _countMeta, count.isAcceptableOrUnknown(data['count']!, _countMeta));
    }
    if (data.containsKey('is_weight')) {
      context.handle(_is_weightMeta,
          is_weight.isAcceptableOrUnknown(data['is_weight']!, _is_weightMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {guid};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Product.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $GoodsTable createAlias(String alias) {
    return $GoodsTable(attachedDatabase, alias);
  }
}

abstract class _$DataBase extends GeneratedDatabase {
  _$DataBase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $MeasesTable meases = $MeasesTable(this);
  late final $GoodsTable goods = $GoodsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [meases, goods];
}
