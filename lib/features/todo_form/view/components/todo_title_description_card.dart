import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_management_app/features/todo_form/constants/todo_form_constant.dart';
import 'package:task_management_app/features/todo_form/controllers/todo_form_controller.dart';
import 'package:task_management_app/shared/widgets/global_textfield.dart';
import 'package:task_management_app/utils/functions/validator.dart';

class TodoTitleDescriptionCard extends StatelessWidget {
  final TodoFormController controller;
  const TodoTitleDescriptionCard({super.key, required this.controller});

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
              controller: controller.titleController,
              label: TodoFormConstant.labelFormTitleField.tr,
              hintText: TodoFormConstant.hintFormTitleField.tr,
              validator: FieldValidator.validateTitle,
            ),
            Divider(
              thickness: 1,
              color: Theme.of(context).colorScheme.secondary,
            ),
            SizedBox(height: 16.h),
            GlobalTextfield.blankTextfield(
              context: context,
              controller: controller.descriptionController,
              label: TodoFormConstant.labelFormDescriptionField.tr,
              hintText: TodoFormConstant.hintFormDescriptionField.tr,
              maxLines: 2,
              validator: FieldValidator.validateDescription,
            ),
            Divider(
              thickness: 1,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ],
        ),
      ),
    );
  }
}
