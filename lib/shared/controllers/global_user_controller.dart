import 'dart:async';
import 'package:get/get.dart';
import 'package:task_management_app/shared/models/global_user_model.dart';
import 'package:task_management_app/shared/repositories/global_get_user_by_id_repo.dart';
import 'package:task_management_app/shared/repositories/global_get_user_login_repo.dart';

class GlobalUserController extends GetxController {
  final getUserRepo = Get.find<GlobalGetUserById>();
  final getUserIdRepo = Get.find<GlobalGetUserLogin>();

  final user = Rxn<UserModel>();
  StreamSubscription? _userSubscription;

  void setUser(UserModel data) {
    if (user.value?.id != data.id) {
      _startWatchingUser(data.id);
    }
    user.value = data;
  }

  Future<void> _initializeUser() async {
    final initialUserId = await getUserIdRepo.getUserId();
    if (initialUserId != null) {
      _startWatchingUser(initialUserId);
    }
  }

  void _startWatchingUser(String id) {
    _userSubscription?.cancel();
    _userSubscription = getUserRepo.watchUserById(id).listen((userData) {
      if (userData != null) {
        user.value = userData;
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    _initializeUser();
  }

  @override
  void onClose() {
    _userSubscription?.cancel();
    super.onClose();
  }
}
