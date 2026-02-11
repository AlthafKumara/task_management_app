import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_management_app/configs/localizations/lang_keys.dart';
import 'package:task_management_app/shared/controllers/global_bottom_nav_controller.dart';

class GlobalBottomNav extends GetView<GlobalBottomNavController> {
  final int initialindex;
  GlobalBottomNav({super.key, required this.initialindex}) {
    controller.currentIndex.value = initialindex;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Obx(
        () => BottomNavigationBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeIndex,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,

          items: [
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Icon(Icons.home_rounded),
                  SizedBox(height: 3.h),
                ],
              ),
              label: LangKeys.homeLabel.tr,
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Icon(Icons.date_range_rounded),
                  SizedBox(height: 3.h),
                ],
              ),
              label: LangKeys.calendarLabel.tr,
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Icon(Icons.data_thresholding_rounded),
                  SizedBox(height: 3.h),
                ],
              ),
              label: LangKeys.statsLabel.tr,
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Icon(Icons.person),
                  SizedBox(height: 3.h),
                ],
              ),
              label: LangKeys.profileLabel.tr,
            ),
          ],
        ),
      ),
    );
  }
}
