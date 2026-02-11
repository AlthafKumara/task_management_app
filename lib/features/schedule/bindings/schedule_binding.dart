import 'package:get/get.dart';
import 'package:task_management_app/features/schedule/controllers/schedule_controller.dart';

class ScheduleBinding extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut(() => ScheduleController()); 
  }
}