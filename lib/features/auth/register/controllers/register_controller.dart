import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/configs/routes/route.dart';
import 'package:task_management_app/features/auth/register/repositories/register_repository.dart';
import 'package:task_management_app/shared/controllers/global_flag_switch_controller.dart';
import 'package:task_management_app/shared/widgets/global_snackbar.dart';

class RegisterController extends GetxController {
  final registerRepo = RegisterRepository();
  final flagSwitchC = Get.find<GlobalFlagSwitchController>();

  var isPasswordVisible = false.obs;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> handleRegister() async {
    try {
      if (!formKey.currentState!.validate()) {
        return;
      }

      final response = await registerRepo.register(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      );
      if (response.status == "success") {
        GlobalSnackbar.showSuccess(response.message);
      } else {
        GlobalSnackbar.showError(response.message);
      }
    } catch (e) {
      GlobalSnackbar.showError(e.toString());
    }
  }

  void navigateToLogin() {
    Get.offNamed(CustomRoute.login);
  }
}
