import 'package:get/get.dart';
import 'package:task_management_app/configs/routes/route.dart';
import 'package:task_management_app/features/profile/repositories/logout_repository.dart';
import 'package:task_management_app/shared/controllers/global_switch_controller.dart';
import 'package:task_management_app/shared/controllers/global_user_controller.dart';
import 'package:task_management_app/shared/models/global_user_model.dart';
import 'package:task_management_app/shared/widgets/global_snackbar.dart';
import 'package:task_management_app/utils/enums/api_status_enum.dart';

class ProfileController extends GetxController {
  final logoutRepo = LogoutRepository(
    authDao: Get.find(),
    userDao: Get.find(),
    localSecureStorage: Get.find(),
  );
  final flagSwitchC = Get.find<GlobalSwitchController>();
  final userC = Get.find<GlobalUserController>();

  UserModel? get dataUser => userC.user.value;

  Future<void> handleLogout() async {
    final response = await logoutRepo.logout();
    if (response.status == ApiStatus.success.name) {
      GlobalSnackbar.showSuccess(response.message);
      navigateToLogin();
    } else {
      GlobalSnackbar.showError(response.message);
    }
  }

  void navigateToLogin() {
    Get.offAllNamed(CustomRoute.login);
  }
}
