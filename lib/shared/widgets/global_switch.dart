import 'package:flutter/material.dart';
import 'package:task_management_app/constants/assets_contstant.dart';
import 'package:task_management_app/shared/styles/app_color.dart';

class GlobalSwitch {
  static Widget darkModeSwitch({
    required BuildContext context,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Switch(
      value: value,
      onChanged: onChanged,
      activeThumbColor: AppColor.white,

      activeTrackColor: AppColor.primaryYellowColor,
      inactiveThumbColor: AppColor.white,
      inactiveTrackColor: AppColor.primaryYellowColor,
    );
  }

  static Widget flagSwitch({
    required BuildContext context,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Switch(
      value: value,
      onChanged: onChanged,
      activeThumbImage: AssetImage(AssetsContstant.usFlag),
      trackOutlineColor: WidgetStateProperty.all(
        Theme.of(context).colorScheme.onSurface,
      ),
      activeTrackColor: AppColor.white,
      inactiveThumbImage: AssetImage(AssetsContstant.indonesianflag),

      inactiveTrackColor: AppColor.danger1,
    );
  }
}
