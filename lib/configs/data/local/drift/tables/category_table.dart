import 'package:drift/drift.dart';

class Category extends Table {
  IntColumn get serverId => integer()();
  TextColumn get name => text()();

   @override
  Set<Column<Object>>? get primaryKey => {serverId};
}
