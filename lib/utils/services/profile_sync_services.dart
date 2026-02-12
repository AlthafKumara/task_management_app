import 'package:get/get.dart';
import 'package:task_management_app/configs/data/local/drift/daos/user_dao.dart';
import 'package:task_management_app/configs/network/network_checker.dart';
import 'package:task_management_app/features/profile/models/update_profile_model.dart';
import 'package:task_management_app/features/profile/repositories/update_profile_repository.dart';
import 'package:task_management_app/shared/controllers/global_user_controller.dart';
import 'package:task_management_app/shared/models/global_user_model.dart';

class ProfileSyncServices extends GetxService {
  final UserDao userDao;
  final UpdateProfileRepository updateProfileRepository;
  final GlobalUserController globalUserController;
  final NetworkChecker networkChecker;

  ProfileSyncServices({
    required this.userDao,
    required this.updateProfileRepository,
    required this.networkChecker,
    required this.globalUserController,
  });

  @override
  void onInit() {
    super.onInit();
    networkChecker.onStatusChange.listen((isOnline) {
      if (isOnline) {
        syncProfile();
      }
    });
  }

  Future<void> syncProfile() async {
    final users = await userDao.getUserNotSynced();
    if (users != null) {

      final response = await updateProfileRepository.remoteUpdateProfile(
        UpdateProfileModel(name: users.name, email: users.email),
      );



      if (response.data != null) {
        await userDao.updateUserAfterSync(users);
        final userModel = UserModel(
          id: users.id,
          name: users.name,
          email: users.email,
          createdAt: users.createdAt,
          isSynced: true,
        );
        globalUserController.setUser(userModel);
      }
    }
  }
}
