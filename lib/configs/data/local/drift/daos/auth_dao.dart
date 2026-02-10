import 'package:drift/drift.dart';
import 'package:task_management_app/configs/data/local/drift/app_database.dart';
import 'package:task_management_app/configs/data/local/drift/tables/auth_table.dart';

part 'auth_dao.g.dart';

@DriftAccessor(tables: [AuthSession])
class AuthDao extends DatabaseAccessor<AppDatabase> with _$AuthDaoMixin {
  AuthDao(super.db);

  Future<AuthSessionData?> getActiveSession() async {
    return await (select(authSession)..where((tbl) => tbl.isLoggedIn.equals(true))).getSingleOrNull();
  }

  Future<void> insertSession(AuthSessionCompanion session) async {
    await into(authSession).insert(session);
  }

  Future<void> updateSession(AuthSessionData session) async {
    await update(authSession).replace(session);
  }

  Future<void> deleteSession(AuthSessionData session) async {
    await delete(authSession).delete(session);
  }

  Future<void> deleteAllSession() async {
    await delete(authSession).go();
  }
}