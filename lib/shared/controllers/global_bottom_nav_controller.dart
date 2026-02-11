import 'package:get/get.dart';
import 'package:task_management_app/configs/routes/route.dart';

class GlobalBottomNavController extends GetxController {
  
  var currentIndex = 0.obs;

  void changeIndex(int index){

    currentIndex.value = index;

    if (index == 0 ) {
      Get.offNamed(CustomRoute.home);
    }else if (index == 1) {
      Get.offNamed(CustomRoute.schedule);
    }else if (index == 2) {
      Get.offNamed(CustomRoute.stats);
    }else if (index == 3) {
      Get.offNamed(CustomRoute.profile);
    }
  }
}