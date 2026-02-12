import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_management_app/features/profile/constants/profile_contstant.dart';
import 'package:task_management_app/features/profile/controllers/edit_profile_controller.dart';
import 'package:task_management_app/features/profile/view/components/edit_profile_card.dart';
import 'package:task_management_app/shared/styles/app_text_style.dart';
import 'package:task_management_app/shared/widgets/global_button.dart';

class EditProfilePage extends GetView<EditProfileController> {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: _body(context),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      leadingWidth: 100.w,
      leading: Padding(
        padding: EdgeInsetsGeometry.only(left: 22.w, top: 16.h),
        child: GestureDetector(
          onTap: () => Get.back(),
          child: Text(
            ProfileContstant.cancelEditProfileButton.tr,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).primaryColor,
              fontWeight: AppTextStyle.light,
            ),
          ),
        ),
      ),
      title: Text(
        ProfileContstant.editProfileTitle.tr,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w, vertical: 24.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CircleAvatar(
                    radius: 50.w,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Text(
                      controller.dataUser?.name!
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
            EditProfileCard(controller: controller),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w, vertical: 32.h),
      child: SizedBox(
        width: double.infinity,
        child: GlobalButton.primaryButton(
          context: context,
          textButton: ProfileContstant.saveEditProfileButton.tr,
          onPressed: () => controller.handleUpdateProfile(),
        ),
      ),
    );
  }
}
