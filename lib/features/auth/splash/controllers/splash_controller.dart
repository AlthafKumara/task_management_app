import 'package:get/get.dart';
import 'package:task_management_app/configs/routes/route.dart';
import 'package:task_management_app/shared/controllers/global_user_controller.dart';
import 'package:task_management_app/shared/repositories/global_get_user_by_id_repo.dart';
import 'package:task_management_app/shared/repositories/global_get_user_login_repo.dart';

class SplashController extends GetxController {
  final globalGetUserLogin = GlobalGetUserLogin(authDao: Get.find());
  final globalGetUserById = GlobalGetUserById(userDao: Get.find());

  final userController = Get.find<GlobalUserController>();
  

  Future<void> splashDelayed() async {
    final checkSessionId = await globalGetUserLogin.getUserId();
    await Future.delayed(const Duration(seconds: 2));
    if (checkSessionId == null) {
      Get.offAllNamed(CustomRoute.login);
    } else {
      final checkSessionUser = await globalGetUserById.getUserById(checkSessionId);
      if (checkSessionUser == null) {
        Get.offAllNamed(CustomRoute.login);
      } else {
        userController.user.value = checkSessionUser;
        Get.offAllNamed(CustomRoute.home);
      }
    }
  }

  // ========================= Route ======================
  void navigateToLogin() {
    Get.offAllNamed(CustomRoute.login);
  } 

  // ========================= Override ======================
  @override
  void onInit() {
    splashDelayed();
    super.onInit();
  }
}
