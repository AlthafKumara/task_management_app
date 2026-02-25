import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_management_app/features/todo_form/constants/todo_form_constant.dart';
import 'package:task_management_app/features/todo_form/controllers/todo_form_controller.dart';

class TodoPriorityCard extends StatelessWidget {
  final TodoFormController controller;
  const TodoPriorityCard({super.key, required this.controller});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TodoFormConstant.priorityFormLabel.tr,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            height: 50.h,
            padding: EdgeInsets.all(5.h),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Obx(
              () => Row(
                children: [
                  _priorityButton(context, TodoFormConstant.priorityLow.tr),
                  _priorityButton(context, TodoFormConstant.priorityMedium.tr),
                  _priorityButton(context, TodoFormConstant.priorityHigh.tr),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _priorityButton(BuildContext context, String label) {
    final isSelected = controller.selectedPriority.value == label;
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.selectedPriority.value = label,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: isSelected
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.onSurface,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
