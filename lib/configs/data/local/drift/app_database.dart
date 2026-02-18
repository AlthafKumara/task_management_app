import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:task_management_app/configs/data/local/drift/daos/todo_dao.dart';
import 'package:task_management_app/configs/data/local/drift/tables/auth_table.dart';
import 'package:task_management_app/configs/data/local/drift/tables/todo_table.dart';
import 'package:task_management_app/configs/data/local/drift/tables/user_table.dart';
import 'package:task_management_app/configs/data/local/drift/daos/user_dao.dart';
import 'package:task_management_app/configs/data/local/drift/daos/auth_dao.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task_management_app/utils/enums/todo_enum.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [User, AuthSession, Todo], daos: [UserDao, AuthDao, TodoDao])
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
