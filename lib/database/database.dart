import 'dart:io';

import 'package:drift/drift.dart';
import 'products_table.dart';
import 'meas_table.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

@DriftDatabase(tables: [Goods, Meases])
class DataBase extends _$DataBase {
  DataBase(String base_name) : super(_openConnection(base_name));

  @override
  int get schemaVersion => 1;

  Future<List<Product>> getAllGoods() => select(goods).get();
  Stream<List<Product>> watchAllGoods() => select(goods).watch();

  Future insertProduct(Product product) => into(goods).insert(product);
}

LazyDatabase _openConnection(String base_name) {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, base_name + '.sqlite'));
    return NativeDatabase(file, logStatements: true);
  });
}
