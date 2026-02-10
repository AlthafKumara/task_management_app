import 'package:drift/drift.dart';
import 'package:task_management_app/configs/data/local/drift/app_database.dart';
import 'package:task_management_app/configs/data/local/drift/tables/user_table.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [User])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(super.db);

  Future<UserData?> getUserById(String id) async {
    return await (select(user)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  Future<void> insertUser(UserCompanion userCompanion) async {
    await into(user).insert(userCompanion);
  }

  Future<void> updateUser(UserData userData) async {
    await update(user).replace(userData);
  }

  Future<void> deleteUser(UserData userData) async {
    await delete(user).delete(userData);
  }

  Future<void> deleteAllUser() async {
    await delete(user).go();
  }
}