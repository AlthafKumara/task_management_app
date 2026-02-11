import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_management_app/features/profile/constants/profile_contstant.dart';
import 'package:task_management_app/features/profile/controllers/profile_controller.dart';
import 'package:task_management_app/features/profile/view/components/profile_card.dart';
import 'package:task_management_app/shared/styles/app_text_style.dart';
import 'package:task_management_app/shared/widgets/global_bottom_nav.dart';
import 'package:task_management_app/shared/widgets/global_button.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(context),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        ProfileContstant.profileTitle.tr,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: CircleAvatar(
                  radius: 50.w,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: Text(
                    controller.dataUser?.name
                            .trim()
                            .split(' ')
                            .map((e) => e[0])
                            .join('') ??
                        '',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: AppTextStyle.semiBold,
                      fontSize: 35.sp,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Text(
            controller.dataUser?.name ?? '',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: AppTextStyle.semiBold,
              fontSize: 20.sp,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            controller.dataUser?.email ?? '',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(height: 24.h),
          SizedBox(
            width: 150.w,
            child: GlobalButton.borderButton(
              radius: 100,
              context: context,
              textButton: ProfileContstant.editProfileTitle.tr,
              onPressed: () {},
            ),
          ),
          SizedBox(height: 24.h),
          ProfileCard(controller: controller,),
          SizedBox(height: 24.h),
          SizedBox(
            width: double.infinity,
            child: GlobalButton.inactiveButton(
              context: context,
              textButton: ProfileContstant.logoutLabel.tr,
              onPressed: () {
                controller.handleLogout();
              },
              radius: 100,
              textColor: Theme.of(context).colorScheme.error,
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return GlobalBottomNav(initialindex: 3);
  }
}
