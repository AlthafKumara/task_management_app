import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalTextfield {
  GlobalTextfield._();

  static Widget textFieldLarge({
    required BuildContext context,
    required String hintText,
    required TextEditingController controller,
    bool obscureText = false,
    TextInputType? keyboardType,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? label,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              )
            : const SizedBox.shrink(),
        label != null ? SizedBox(height: 8.h) : const SizedBox.shrink(),
        TextFormField(
          style: Theme.of(context).textTheme.displayMedium,
          obscureText: obscureText,
          controller: controller,
          keyboardType: keyboardType ?? TextInputType.text,
          validator: validator,
          decoration: InputDecoration(
            hintStyle: Theme.of(context).textTheme.displayMedium,
            labelStyle: Theme.of(context).textTheme.displayMedium,
            errorStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: Theme.of(context).colorScheme.error,
            ),
            fillColor: Theme.of(context).colorScheme.surface,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ),
      ],
    );
  }

  static Widget blankTextfield({
    required BuildContext context,
    required TextEditingController controller,
    int? maxLines,
    String? hintText,
    bool obscureText = false,
    TextInputType? keyboardType,
    String? label,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              )
            : const SizedBox.shrink(),
        label != null ? SizedBox(height: 8.h) : const SizedBox.shrink(),
        TextFormField(
          maxLines: maxLines ?? 1,
          style: Theme.of(context).textTheme.displayMedium,
          obscureText: obscureText,
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(
            hintStyle: Theme.of(context).textTheme.displayMedium,
            labelStyle: Theme.of(context).textTheme.displayMedium,
            errorStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: Theme.of(context).colorScheme.error,
            ),
            fillColor: Colors.transparent,
            hintText: hintText ?? "",
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
        ),
      ],
    );
  }
}
