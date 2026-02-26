import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_management_app/features/todo_form/constants/todo_form_constant.dart';
import 'package:task_management_app/features/todo_form/controllers/todo_form_controller.dart';

class TodoDateCard extends StatelessWidget {
  final TodoFormController controller;
  const TodoDateCard({super.key, required this.controller});

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
          GestureDetector(
            onTap: () => controller.selectStartDate(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.date_range,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      TodoFormConstant.formStartDateLabel.tr,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Obx(() {
                      DateTime? startDate = controller.selectedStartDate.value;
                      return Text(
                        startDate == null
                            ? TodoFormConstant.today.tr
                            : "${startDate.day} ${controller.monthEnd} ${startDate.year}",

                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    }),
                    SizedBox(width: 8.w),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 14.sp,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          Divider(thickness: 1, color: Theme.of(context).colorScheme.secondary),
          SizedBox(height: 12.h),
          GestureDetector(
            onTap: () => controller.selectEndDate(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.date_range,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      TodoFormConstant.formDeadlineDateLabel.tr,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Obx(() {
                      DateTime? endDate = controller.selectedEndDate.value;
                      return endDate != null
                          ? Text(
                              "${endDate.day} ${controller.monthEnd} ${endDate.year}",
                              style: Theme.of(context).textTheme.titleSmall
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface,
                                    fontWeight: FontWeight.w500,
                                  ),
                            )
                          : SizedBox.shrink();
                    }),
                    SizedBox(width: 8.w),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 14.sp,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
