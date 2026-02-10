import 'package:get/get.dart';
import 'package:task_management_app/configs/routes/route.dart';
import 'package:task_management_app/features/auth/splash/repository/splash_repository.dart';

class SplashController extends GetxController {
  final splashRepository = SplashRepository(
    authDao: Get.find(),
    userDao: Get.find(),
  );

  Future<void> splashDelayed() async {
    final checkSession = await splashRepository.checkSession();
    await Future.delayed(const Duration(seconds: 2));
    if (checkSession) {
      Get.offAllNamed(CustomRoute.home);
    } else {
      Get.offAllNamed(CustomRoute.login);
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
