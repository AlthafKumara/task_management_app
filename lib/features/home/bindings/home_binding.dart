import 'package:get/get.dart';
import 'package:task_management_app/configs/data/local/drift/daos/auth_dao.dart';
import 'package:task_management_app/configs/data/local/drift/daos/user_dao.dart';
import 'package:task_management_app/features/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthDao(Get.find()));
    Get.lazyPut(() => UserDao(Get.find()));
    Get.lazyPut(() => HomeController());
    
  }
}
