import 'package:drift/drift.dart';
import 'package:rmk/database/database.dart';
import 'meas_table.dart';

@DataClassName("Product")
class Goods extends Table {
  IntColumn get guid => integer().autoIncrement()();
  BoolColumn get is_deleted => boolean().withDefault(const Constant(false))();
  TextColumn get code => text().withLength(min: 1, max: 20)();
  TextColumn get name => text().withLength(min: 1, max: 200)();
  RealColumn get nds => real().withDefault(const Constant(0))();
  IntColumn get meas_guid => integer().references(Meases, #guid).nullable()();
  IntColumn get count => integer().withDefault(const Constant(0))();
  BoolColumn get is_weight => boolean().withDefault(const Constant(false))();
  RealColumn get price => real()();
}
