import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_management_app/features/profile/constants/profile_contstant.dart';
import 'package:task_management_app/features/profile/controllers/edit_profile_controller.dart';
import 'package:task_management_app/shared/widgets/global_textfield.dart';
import 'package:task_management_app/utils/functions/validator.dart';

class EditProfileCard extends StatelessWidget {
  final EditProfileController controller;
  const EditProfileCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Column(
          children: [
            GlobalTextfield.blankTextfield(
              context: context,
              controller: controller.nameController,
              keyboardType: TextInputType.name,
              label: ProfileContstant.editProfileNameTitle.tr,
              validator: FieldValidator.validateName,
            ),

            Divider(
              thickness: 1,
              color: Theme.of(context).colorScheme.secondary,
            ),
            SizedBox(height: 20.h),

            GlobalTextfield.blankTextfield(
              context: context,
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
              label: ProfileContstant.editProfileEmailTitle.tr,
              validator: FieldValidator.validateEmail,
            ),
          ],
        ),
      ),
    );
  }
}
