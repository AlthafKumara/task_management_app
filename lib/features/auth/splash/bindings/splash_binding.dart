import 'package:get/get.dart';

import 'package:task_management_app/features/auth/splash/controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    
    

    Get.lazyPut(() => SplashController());
  }
}
