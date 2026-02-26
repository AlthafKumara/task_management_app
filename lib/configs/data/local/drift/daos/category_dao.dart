import 'package:drift/drift.dart';
import 'package:task_management_app/configs/data/local/drift/app_database.dart';
import 'package:task_management_app/configs/data/local/drift/tables/category_table.dart';

part 'category_dao.g.dart';

@DriftAccessor(tables: [Category])
class CategoryDao extends DatabaseAccessor<AppDatabase>
    with _$CategoryDaoMixin {
  CategoryDao(super.db);

  Future<void> insertCategory(CategoryCompanion categoryCompanion) {
    return into(category).insert(categoryCompanion);
  }

  Future<void> replaceCategories(List<CategoryCompanion> categories) async {
    await transaction(() async {
      await delete(category).go();
      for (final cat in categories) {
        await into(category).insert(cat);
      }
    });
  }

  Future<List<CategoryData?>> getCategory() {
    return select(category).get();
  }
}
