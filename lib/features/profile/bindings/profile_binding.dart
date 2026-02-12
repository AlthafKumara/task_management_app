import 'package:get/get.dart';
import 'package:task_management_app/configs/data/local/drift/daos/auth_dao.dart';
import 'package:task_management_app/configs/data/local/drift/daos/user_dao.dart';
import 'package:task_management_app/configs/data/local/local_secure_storage.dart';
import 'package:task_management_app/features/profile/controllers/edit_profile_controller.dart';
import 'package:task_management_app/features/profile/controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthDao(Get.find()));
    Get.lazyPut(() => UserDao(Get.find()));
    Get.lazyPut(() => LocalSecureStorage());

    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => EditProfileController());
  }
}
