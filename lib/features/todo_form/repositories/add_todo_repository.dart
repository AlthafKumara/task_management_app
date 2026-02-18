import 'package:task_management_app/configs/data/local/drift/app_database.dart';
import 'package:task_management_app/configs/data/local/drift/daos/todo_dao.dart';

class AddTodoRepository {
  final TodoDao todoDao;

  AddTodoRepository({required this.todoDao});

  Future<void> localAddTodo(TodoCompanion todoCompanion) async {
    
  }
}