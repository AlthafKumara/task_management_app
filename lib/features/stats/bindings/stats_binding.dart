import 'package:get/get.dart';
import 'package:task_management_app/features/stats/controllers/stats_controller.dart';

class StatsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => StatsController()); 
  }
}