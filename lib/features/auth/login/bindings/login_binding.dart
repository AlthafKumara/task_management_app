import 'package:get/get.dart';
import 'package:task_management_app/features/auth/login/controllers/login_controller.dart';
import 'package:task_management_app/shared/controllers/global_flag_switch_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => GlobalFlagSwitchController(), fenix: true);
  }
}
