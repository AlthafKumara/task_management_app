import 'package:get/get.dart';
import 'package:task_management_app/configs/data/local/drift/app_database.dart';
import 'package:task_management_app/configs/data/local/drift/daos/todo_dao.dart';
import 'package:task_management_app/configs/data/local/drift/daos/user_dao.dart';
import 'package:task_management_app/configs/data/local/local_secure_storage.dart';
import 'package:task_management_app/configs/network/network_checker.dart';
import 'package:task_management_app/features/profile/repositories/update_profile_repository.dart';
import 'package:task_management_app/shared/controllers/global_switch_controller.dart';
import 'package:task_management_app/shared/controllers/global_user_controller.dart';
import 'package:task_management_app/configs/data/local/drift/daos/auth_dao.dart';
import 'package:task_management_app/shared/repositories/global_get_user_by_id_repo.dart';
import 'package:task_management_app/shared/repositories/global_get_user_login_repo.dart';
import 'package:task_management_app/utils/services/profile_sync_services.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AppDatabase(), permanent: true);
    Get.put(NetworkChecker(), permanent: true);
    Get.put(LocalSecureStorage(), permanent: true);
    Get.lazyPut(() => UserDao(Get.find<AppDatabase>()));
    Get.lazyPut(() => AuthDao(Get.find<AppDatabase>()));
    Get.lazyPut(() => TodoDao(Get.find<AppDatabase>()));

    
    Get.lazyPut(() => GlobalGetUserById(userDao: Get.find<UserDao>()));
    Get.lazyPut(() => GlobalGetUserLogin(authDao: Get.find<AuthDao>()));
    Get.put(GlobalUserController(), permanent: true);
    Get.put(GlobalSwitchController(), permanent: true);



    Get.lazyPut(
      () => UpdateProfileRepository(
        localSecureStorage: Get.find<LocalSecureStorage>(),
        networkChecker: Get.find<NetworkChecker>(),
        userDao: Get.find<UserDao>(),
      ),
    );

    Get.put(
      ProfileSyncServices(
        updateProfileRepository: Get.find<UpdateProfileRepository>(),
        userDao: Get.find<UserDao>(),
        networkChecker: Get.find<NetworkChecker>(),
        globalUserController: Get.find<GlobalUserController>(),
      ),
      permanent: true,
    );
  }
}
