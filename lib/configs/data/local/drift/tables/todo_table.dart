import 'package:drift/drift.dart';
import 'package:task_management_app/utils/enums/todo_enum.dart';

class Todo extends Table {
  IntColumn get localId => integer().autoIncrement()();
  TextColumn get serverId => text().nullable()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get status =>
      text().withDefault(Constant(TodoStatus.pending.name))();
  TextColumn get priority =>
      text().withDefault(Constant(TodoPriority.low.name))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get startAt => dateTime()();
  DateTimeColumn get deadline => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
}
