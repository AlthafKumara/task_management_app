import 'package:get/get.dart';
import 'package:task_management_app/shared/controllers/global_bottom_nav_controller.dart';

class GlobalBottomNavBinding extends Bindings {
  
  @override
  void dependencies() {
    Get.lazyPut(() => GlobalBottomNavController()); 
  }
}