import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/configs/routes/route.dart';
import 'package:task_management_app/features/auth/login/repositories/login_repository.dart';
import 'package:task_management_app/shared/controllers/global_switch_controller.dart';
import 'package:task_management_app/shared/controllers/global_user_controller.dart';
import 'package:task_management_app/shared/models/global_user_model.dart';
import 'package:task_management_app/shared/widgets/global_snackbar.dart';
import 'package:task_management_app/utils/enums/api_status_enum.dart';

class LoginController extends GetxController {
  final loginRepo = LoginRepository(
    authDao: Get.find(),
    userDao: Get.find(),
    localSecureStorage: Get.find(),
  );
  final flagSwitchC = Get.find<GlobalSwitchController>();
  final globalUserC = Get.find<GlobalUserController>();

  var isPasswordVisible = false.obs;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> handleLogin() async {
    try {
      if (!formKey.currentState!.validate()) {
        return;
      }

      final response = await loginRepo.login(
        email: emailController.text,
        password: passwordController.text,
      );
      if (response.status == ApiStatus.success.name) {
        final userModel = UserModel(
          id: response.data!.id!,
          name: response.data!.name!,
          email: response.data!.email!,
          createdAt: response.data!.createdAt!,
        );
        globalUserC.setUser(userModel);

        GlobalSnackbar.showSuccess(response.message);
        navigateToHome();
      } else {
        GlobalSnackbar.showError(response.message);
      }
    } catch (e) {
      GlobalSnackbar.showError(e.toString());
    }
  }

  // ======================== Navigate ========================
  void navigateToHome() {
    Get.offAllNamed(CustomRoute.home);
  }

  void navigateToRegister() {
    Get.offAllNamed(CustomRoute.register);
  }
}
