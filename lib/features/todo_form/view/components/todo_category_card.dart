import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_management_app/features/todo_form/constants/todo_form_constant.dart';
import 'package:task_management_app/features/todo_form/controllers/todo_form_controller.dart';

class TodoCategoryCard extends StatelessWidget {
  final TodoFormController controller;
  const TodoCategoryCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: GestureDetector(
        onTap: () => _bottomSheetCategory(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.category_rounded,
                  color: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(width: 12.w),
                Text(
                  TodoFormConstant.hintCategoryField.tr,
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
                  final categoryC = controller.categoryC;
                  return Text(
                    categoryC.selectedCategory.value?.name ??
                        TodoFormConstant.hintCategoryField.tr,
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
    );
  }

  Future<dynamic> _bottomSheetCategory(BuildContext context) {
    return Get.bottomSheet(
      Container(
        color: Theme.of(context).cardTheme.color,
        height: 400.h,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(
              width: 42.w,
              child: Divider(
                color: Theme.of(context).colorScheme.onSurface,
                thickness: 6.h,
                radius: BorderRadius.circular(999),
              ),
            ),
            SizedBox(height: 48.h),
            _chipCategory(context),
          ],
        ),
      ),
    );
  }

  Widget _chipCategory(BuildContext context) {
    final theme = Theme.of(context);

    return controller.categoryC.obx(
      (categories) {
        if (categories == null || categories.isEmpty) {
          return Text(
            'No category available',
            style: theme.textTheme.bodyMedium,
          );
        }

        return Obx(() {
          final selected = controller.categoryC.selectedCategory.value;

          return Wrap(
            spacing: 10.w,
            runSpacing: 10.h,
            children: categories.map((category) {
              final isSelected = selected?.id == category.id;

              return ChoiceChip(
                label: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                  child: Text(
                    category.name,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: isSelected
                          ? theme.colorScheme.onPrimary
                          : theme.colorScheme.onSurface,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                selected: isSelected,
                selectedColor: theme.colorScheme.primary,
                backgroundColor: theme.colorScheme.surface,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  side: BorderSide(color: Colors.transparent),
                ),

                onSelected: (_) {
                  controller.categoryC.selectCategory(category);
                  Get.back(); // optional: close bottom sheet
                },
              );
            }).toList(),
          );
        });
      },

      // LOADING STATE
      onLoading: const Center(child: CircularProgressIndicator()),

      // ERROR STATE
      onError: (error) => Center(
        child: Text(
          error ?? 'Failed to load categories',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.error,
          ),
        ),
      ),
    );
  }
}
