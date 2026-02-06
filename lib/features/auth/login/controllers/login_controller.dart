
import 'package:get/get.dart';
import 'package:task_management_app/configs/routes/route.dart';
import 'package:task_management_app/shared/controllers/global_flag_switch_controller.dart';

class LoginController extends GetxController {
  final flagSwitchC = Get.find<GlobalFlagSwitchController>();

  // ======================== Navigate ========================
  void navigateToRegister() {
    Get.offNamed(CustomRoute.register);
  }
}
