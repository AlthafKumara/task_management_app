import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_management_app/features/schedule/constants/schedule_constant.dart';
import 'package:task_management_app/features/schedule/controllers/schedule_controller.dart';
import 'package:task_management_app/shared/widgets/global_bottom_nav.dart';

class SchedulePage extends GetView<ScheduleController> {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(),
      bottomNavigationBar: _bottomNavigationBar(),
      floatingActionButton: _floatingActionButton(context, controller),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        ScheduleConstant.scheduleTitle.tr,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }

  Widget _body() {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 24.h, horizontal: 20.w),
      child: Column(children: [
          
        ],
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return GlobalBottomNav(initialindex: 1);
  }

  Widget _floatingActionButton(
    BuildContext context,
    ScheduleController controller,
  ) {
    return FloatingActionButton(
      
      backgroundColor: Theme.of(context).colorScheme.primary,
      onPressed: () => controller.navigateToTodoForm(),
      child: Icon(Icons.add, color: Theme.of(context).scaffoldBackgroundColor),
    );
  }
}
