import 'package:get/get.dart';
import 'package:task_management_app/features/auth/login/controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
