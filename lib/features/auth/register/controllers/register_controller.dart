import 'package:get/get.dart';
import 'package:task_management_app/configs/routes/route.dart';
import 'package:task_management_app/shared/controllers/global_flag_switch_controller.dart';

class RegisterController extends GetxController {
  final flagSwitchC = Get.find<GlobalFlagSwitchController>();

  void navigateToLogin() {
    Get.offNamed(CustomRoute.login);
  }
}
