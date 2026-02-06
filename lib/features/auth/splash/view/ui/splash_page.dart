import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:task_management_app/features/auth/splash/constants/splash_constant.dart';
import 'package:task_management_app/features/auth/splash/controllers/splash_controller.dart';
import 'package:task_management_app/shared/styles/app_color.dart';
import 'package:task_management_app/shared/styles/app_text_style.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
      controller.splashDelayed;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              SplashConstant.title,
              style: AppTextStyle.title(color: AppColor.primaryYellowColor),
            ),
            SizedBox(height: 10.h),
            LoadingAnimationWidget.progressiveDots(
              color: AppColor.primaryYellowColor,
              size: 25.sp,
            ),
          ],
        ),
      ),
    );
  }
}
