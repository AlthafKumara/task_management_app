import 'package:get/get.dart';
import 'package:task_management_app/configs/routes/route.dart';

class SplashController extends GetxController {
  Future<void> splashDelayed() async {
    await Future.delayed(const Duration(seconds: 3));
    navigateToLogin();
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
