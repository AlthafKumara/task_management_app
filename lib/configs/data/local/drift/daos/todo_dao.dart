import 'package:drift/drift.dart';
import 'package:task_management_app/configs/data/local/drift/app_database.dart';
import 'package:task_management_app/configs/data/local/drift/tables/todo_table.dart';

part 'todo_dao.g.dart';

@DriftAccessor(tables: [Todo])
class TodoDao extends DatabaseAccessor<AppDatabase> with _$TodoDaoMixin {
  TodoDao(super.db);

  Future<TodoData> getTodoByUserId(String serverId) {
    return (select(
      todo,
    )..where((tbl) => tbl.serverId.equals(serverId))).getSingle();
  }

  Future<void> insertTodo(TodoCompanion todoCompaninon) {
    return into(todo).insert(todoCompaninon);
  }

  Future<void> updateTodo(TodoData todoData) {
    return update(todo).replace(todoData);
  }

  Future<void> deleteTodo(TodoData todoData) {
    return delete(todo).delete(todoData);
  }
}
