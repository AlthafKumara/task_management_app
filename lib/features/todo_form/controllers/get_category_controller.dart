import 'dart:developer';

import 'package:get/get.dart';
import 'package:task_management_app/features/todo_form/repositories/get_category_repository.dart';
import 'package:task_management_app/shared/models/global_category_model.dart';

class GetCategoryController extends GetxController
    with StateMixin<List<CategoryModel>> {
  final categoryRepo = GetCategoryRepository(
    categoryDao: Get.find(),
    localSecureStorage: Get.find(),
    networkChecker: Get.find(),
  );

  final RxList<CategoryModel> categories = <CategoryModel>[].obs;
  final Rxn<CategoryModel?> selectedCategory = Rxn<CategoryModel?>();

  @override
  void onInit() {
    super.onInit();
    loadCategories();
  }

  Future<void> loadCategories() async {
    change(null, status: RxStatus.loading());
    try {
      final fetchedCategories = await categoryRepo.getCategory();
      categories.assignAll(fetchedCategories);
      change(fetchedCategories, status: RxStatus.success());
    } catch (e) {
      log(e.toString());
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void selectCategory(CategoryModel category) {
    if (selectedCategory.value?.id == category.id) {
      selectedCategory.value = null;
    } else {
      selectedCategory.value = category;
    }
  }
}
