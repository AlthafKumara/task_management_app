import 'package:get/get.dart';
import 'package:task_management_app/configs/data/local/drift/app_database.dart';
import 'package:task_management_app/shared/controllers/global_switch_controller.dart';
import 'package:task_management_app/shared/controllers/global_user_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AppDatabase(), permanent: true);
    Get.put(GlobalUserController(), permanent: true);
    Get.put(GlobalSwitchController(), permanent: true);
  }
}
