import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/configs/localizations/lang_keys.dart';
import 'package:task_management_app/features/todo_form/controllers/get_category_controller.dart';
import 'package:task_management_app/features/todo_form/repositories/add_todo_repository.dart';

class TodoFormController extends GetxController {
  final createTodoRepo = AddTodoRepository(todoDao: Get.find());
  final categoryC = Get.find<GetCategoryController>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final selectedPriority = "".obs;
  Rxn<DateTime?> selectedEndDate = Rxn<DateTime?>();
  Rxn<DateTime?> selectedStartDate = Rxn<DateTime?>();
  String get monthEnd => _getMonthName(selectedEndDate.value!.month).tr;
  String get monthStart => _getMonthName(selectedStartDate.value!.month).tr;

  Future<DateTime?> selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedStartDate.value ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedStartDate.value) {
      selectedStartDate.value = picked;
    }
    return picked;
  }

  Future<DateTime?> selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedEndDate.value ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedEndDate.value) {
      selectedEndDate.value = picked;
    }
    return picked;
  }

  String _getMonthName(int month) {
    switch (month) {
      case DateTime.january:
        return LangKeys.january;
      case DateTime.february:
        return LangKeys.february;
      case DateTime.march:
        return LangKeys.march;
      case DateTime.april:
        return LangKeys.april;
      case DateTime.may:
        return LangKeys.may;
      case DateTime.june:
        return LangKeys.june;
      case DateTime.july:
        return LangKeys.july;
      case DateTime.august:
        return LangKeys.august;
      case DateTime.september:
        return LangKeys.september;
      case DateTime.october:
        return LangKeys.october;
      case DateTime.november:
        return LangKeys.november;
      case DateTime.december:
        return LangKeys.december;
      default:
        return '';
    }
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
