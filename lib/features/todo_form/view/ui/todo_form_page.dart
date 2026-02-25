import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_management_app/features/todo_form/constants/todo_form_constant.dart';
import 'package:task_management_app/features/todo_form/controllers/todo_form_controller.dart';
import 'package:task_management_app/features/todo_form/view/components/todo_priority_card.dart';
import 'package:task_management_app/features/todo_form/view/components/todo_title_description_card.dart';
import 'package:task_management_app/shared/styles/app_text_style.dart';
import 'package:task_management_app/shared/widgets/global_button.dart';

class TodoFormPage extends GetView<TodoFormController> {
  const TodoFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: _body(context),
      bottomNavigationBar: _bottomNav(context),
    );
  }

  PreferredSizeWidget _appbar(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      leadingWidth: 100.w,
      leading: Padding(
        padding: EdgeInsetsGeometry.only(left: 22.w, top: 16.h),
        child: GestureDetector(
          onTap: () => Get.back(),
          child: Text(
            TodoFormConstant.cancelFormButton.tr,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).primaryColor,
              fontWeight: AppTextStyle.light,
            ),
          ),
        ),
      ),
      title: Text(
        TodoFormConstant.todoFormTitle.tr,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 24.h, horizontal: 20.w),
      child: Column(
        children: [
          TodoTitleDescriptionCard(controller: controller),
          SizedBox(height: 20.h,),
          TodoPriorityCard(controller: controller),
        ],
      ),
    );
  }

  Widget _bottomNav(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 24.h, horizontal: 20.w),
      child: SizedBox(
        width: double.infinity,
        child: GlobalButton.primaryButton(
          context: context,
          textButton: TodoFormConstant.submitFormButton.tr,
          onPressed: () {},
        ),
      ),
    );
  }
}
