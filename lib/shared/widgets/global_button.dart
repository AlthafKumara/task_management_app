import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/shared/styles/app_color.dart';

class GlobalButton {
  static Widget primaryButton({
    required BuildContext context,
    required String textButton,
    required VoidCallback onPressed,
    bool isLoading = false,
    bool isDisabled = false,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      child: Text(
        textButton,
        style: Theme.of(context).textTheme.displayLarge?.copyWith(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }

  static Widget borderButton({
    required BuildContext context,
    required String textButton,
    required VoidCallback onPressed,
    required int radius,
    bool isLoading = false,
    bool isDisabled = false,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.w),
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius.r),
          side: BorderSide(color: Theme.of(context).primaryColor, width: 1.w),
        ),
      ),
      child: Text(
        textButton,
        style: Theme.of(context).textTheme.displayLarge?.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }

  static Widget inactiveButton({
    required BuildContext context,
    required String textButton,
    required VoidCallback onPressed,
    required int radius,
    required Color textColor,
    bool isLoading = false,
    bool isDisabled = false,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
        backgroundColor: AppColor.tertiaryBackgroundDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius.r),
        ),
      ),
      child: Text(
        textButton,
        style: Theme.of(
          context,
        ).textTheme.displayLarge?.copyWith(color: textColor),
      ),
    );
  }
}
