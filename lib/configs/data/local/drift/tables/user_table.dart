import 'package:drift/drift.dart';

class User extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get email => text()();
  TextColumn get createdAt => text()();
  BoolColumn get isSynced => boolean()();
  

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
