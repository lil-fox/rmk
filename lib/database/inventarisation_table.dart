import 'package:drift/drift.dart';
import 'package:rmk/database/database.dart';

@DataClassName("Inventarisation")
class Inventarisations extends Table {
  IntColumn get guid => integer().autoIncrement()();
  BoolColumn get is_deleted => boolean().withDefault(const Constant(false))();
  DateTimeColumn get date => dateTime().withDefault(Constant(DateTime.now()))();
  TextColumn get prefix =>
      text().withLength(max: 5).withDefault(const Constant("pref"))();
  TextColumn get number =>
      text().withLength(max: 20).withDefault(const Constant("num"))();
}

@DataClassName("InventarisationEntry")
class InventarisationEntries extends Table {
  IntColumn get inventarisation => integer()();
  IntColumn get product => integer()();
}

class InventarisationDocument {
  final Inventarisations inventarisation;
  final List<Product> products;

  InventarisationDocument(this.inventarisation, this.products);
}
