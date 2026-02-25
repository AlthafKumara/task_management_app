import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_management_app/features/home/constants/home_constant.dart';
import 'package:task_management_app/features/home/controllers/home_controller.dart';
import 'package:task_management_app/shared/styles/app_text_style.dart';
import 'package:task_management_app/shared/widgets/global_bottom_nav.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      body: _body(context),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _body(BuildContext context) {
    final String safetyNullName =
        controller.userC.user.value?.name ?? "Undefined";
    final String name = safetyNullName.split(" ").first;

    return SafeArea(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 24.h, vertical: 20.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${controller.todayC.dayName}, ${controller.todayC.date} ${controller.todayC.monthName} ${controller.todayC.year}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "${HomeConstant.welcomeLabel.tr} $name ",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 20.w,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: Text(
                    controller.userC.user.value?.name
                            ?.trim()
                            .split(' ')
                            .map((e) => e[0])
                            .join('') ??
                        '',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: AppTextStyle.semiBold,
                      fontSize: 13.sp,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return GlobalBottomNav(initialindex: 0);
  }
}
