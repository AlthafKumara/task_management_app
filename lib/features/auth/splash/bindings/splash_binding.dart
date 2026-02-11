import 'package:get/get.dart';
import 'package:task_management_app/configs/data/local/drift/daos/auth_dao.dart';
import 'package:task_management_app/configs/data/local/drift/daos/user_dao.dart';
import 'package:task_management_app/features/auth/splash/controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthDao(Get.find()));
    Get.lazyPut(() => UserDao (Get.find()));
    Get.lazyPut(() => SplashController());
  }
}
