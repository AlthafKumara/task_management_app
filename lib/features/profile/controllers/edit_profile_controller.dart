import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/configs/data/local/drift/daos/user_dao.dart';
import 'package:task_management_app/configs/routes/route.dart';
import 'package:task_management_app/features/profile/controllers/profile_controller.dart';
import 'package:task_management_app/features/profile/repositories/update_profile_repository.dart';
import 'package:task_management_app/shared/models/global_user_model.dart';
import 'package:task_management_app/shared/widgets/global_snackbar.dart';

class EditProfileController extends GetxController {
  final updateProfileRepository = UpdateProfileRepository(
    localSecureStorage: Get.find(),
    networkChecker: Get.find(),
    userDao: Get.find<UserDao>(),
  );

  final profileC = Get.find<ProfileController>();

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  UserModel? get dataUser => profileC.dataUser;

  Future<void> handleUpdateProfile() async {
    try {
      if (!formKey.currentState!.validate()) {
        return;
      }

      final user = await updateProfileRepository.updateProfile(
        UserModel(
          id: dataUser!.id,
          name: nameController.text,
          email: emailController.text,
          createdAt: dataUser!.createdAt,
        ),
      );

      profileC.userC.setUser(user);
      GlobalSnackbar.showSuccess('Profile updated successfully');
      navigateToProfile();
    } catch (e) {
      GlobalSnackbar.showError(e.toString());
    }
  }

  void navigateToProfile() {
    Get.offAllNamed(CustomRoute.profile);
  }

  @override
  void onInit() {
    super.onInit();
    nameController.text = dataUser?.name ?? '';
    emailController.text = dataUser?.email ?? '';
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
