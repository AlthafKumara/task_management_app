import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_management_app/features/profile/constants/profile_contstant.dart';
import 'package:task_management_app/features/profile/controllers/profile_controller.dart';
import 'package:task_management_app/shared/styles/app_color.dart';
import 'package:task_management_app/shared/widgets/global_switch.dart';

class ProfileCard extends StatelessWidget {
  final ProfileController controller;
  const ProfileCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColor.primaryYellowColor.withValues(
                      alpha: 0.1,
                    ),
                    child: Icon(
                      Icons.dark_mode_rounded,
                      size: 20.sp,
                      color: AppColor.primaryYellowColor,
                    ),
                  ),

                  SizedBox(width: 12.w),
                  Text(
                    ProfileContstant.darkmodeLabel.tr,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ],
              ),
              Obx(
                () => GlobalSwitch.darkModeSwitch(
                  context: context,
                  value: controller.flagSwitchC.isDarkMode.value,
                  onChanged: (value) => controller.flagSwitchC.toggleDarkMode(),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Divider(thickness: 1, color: Theme.of(context).colorScheme.secondary),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue.withValues(alpha: 0.1),
                    child: Icon(
                      Icons.language_rounded,
                      size: 20.sp,
                      color: Colors.blue,
                    ),
                  ),

                  SizedBox(width: 12.w),
                  Text(
                    ProfileContstant.languageLabel.tr,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ],
              ),
              Obx(
                () => GlobalSwitch.flagSwitch(
                  context: context,
                  value: controller.flagSwitchC.isEnglish.value,
                  onChanged: (value) => controller.flagSwitchC.toggleFlag(),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Divider(thickness: 1, color: Theme.of(context).colorScheme.secondary),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColor.warning1.withValues(alpha: 0.1),
                    child: Icon(
                      Icons.notifications_active_rounded,
                      size: 20.sp,
                      color: AppColor.warning1,
                    ),
                  ),

                  SizedBox(width: 12.w),
                  Text(
                    ProfileContstant.notificationLabel.tr,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20.sp,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
