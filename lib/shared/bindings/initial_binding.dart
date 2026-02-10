import 'package:get/get.dart';
import 'package:task_management_app/configs/data/local/drift/app_database.dart';
import 'package:task_management_app/shared/controllers/global_flag_switch_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AppDatabase(), permanent: true);
    Get.put(GlobalFlagSwitchController(), permanent: true);
  }
}
