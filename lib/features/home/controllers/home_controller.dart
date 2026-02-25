import 'package:get/get.dart';
import 'package:task_management_app/features/home/controllers/today_controller.dart';
import 'package:task_management_app/shared/controllers/global_user_controller.dart';
import 'package:task_management_app/shared/models/global_user_model.dart';

class HomeController extends GetxController {
  final userC = Get.find<GlobalUserController>();
  final todayC = Get.find<TodayController>();

  

  Rxn<UserModel> get dataUser => userC.user;
}
