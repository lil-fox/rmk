import 'package:drift/drift.dart';

@DataClassName("Meas")
class Meases extends Table {
  IntColumn get guid => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 20)();
}
