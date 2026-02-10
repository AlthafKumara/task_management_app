import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:task_management_app/configs/data/local/drift/tables/auth_table.dart';
import 'package:task_management_app/configs/data/local/drift/tables/user_table.dart';
import 'package:task_management_app/configs/data/local/drift/daos/user_dao.dart';
import 'package:task_management_app/configs/data/local/drift/daos/auth_dao.dart';
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [User, AuthSession], daos: [UserDao, AuthDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File('${dbFolder.path}/app.db');
    return NativeDatabase(file);
  });
}
