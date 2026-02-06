import 'package:get/get.dart';
import 'package:task_management_app/features/auth/register/controllers/register_controller.dart';
import 'package:task_management_app/shared/controllers/global_flag_switch_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
    Get.lazyPut(() => GlobalFlagSwitchController(), fenix: true);
  }
}
