import 'package:get/get.dart';
import 'package:task_management_app/shared/models/global_user_model.dart';
import 'package:task_management_app/shared/repositories/global_get_user_by_id.dart';
import 'package:task_management_app/shared/repositories/global_get_user_login.dart';

class HomeController extends GetxController {
  final globalGetUserLogin = GlobalGetUserLogin(authDao: Get.find());
  final globalGetUserById = GlobalGetUserById(userDao: Get.find());

  final userdata = Rxn<UserModel>();

  Future<UserModel> getUser() async {
    final userId = await globalGetUserLogin.getUserId();

    final user = await globalGetUserById.getUserById(userId!);
    if (user != null) {
      userdata.value = user;
    }
    return user!;
  }

  @override
  void onInit() {
    getUser();
    super.onInit();
  }
}
