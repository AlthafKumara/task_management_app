import 'package:get/get.dart';
import 'package:task_management_app/features/todo_form/controllers/todo_form_controller.dart';

class TodoFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TodoFormController());
  }
}