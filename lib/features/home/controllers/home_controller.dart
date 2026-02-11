import 'package:get/get.dart';
import 'package:task_management_app/shared/controllers/global_user_controller.dart';
import 'package:task_management_app/shared/models/global_user_model.dart';

class HomeController extends GetxController {
  final userC = Get.find<GlobalUserController>();

  Rxn<UserModel> get dataUser => userC.user;
}
