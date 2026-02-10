import 'package:drift/drift.dart';

class AuthSession extends Table{
  TextColumn get id => text()();
  TextColumn get userId => text()();
  TextColumn get accessToken => text()();
  BoolColumn get isLoggedIn => boolean().withDefault(const Constant(false))();
  DateTimeColumn get lastLogin => dateTime()();
  

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
