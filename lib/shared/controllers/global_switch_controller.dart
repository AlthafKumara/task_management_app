import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalSwitchController extends GetxController {
  var isDarkMode = true.obs;
  var isEnglish = true.obs;

  void toggleFlag() {
    isEnglish.toggle();
  }

  void toggleDarkMode() {
    isDarkMode.toggle();
  }

  @override
  void onInit() {
    super.onInit();
    ever(isEnglish, (value) {
      if (value) {
        Get.updateLocale(const Locale('en', 'US'));
      } else {
        Get.updateLocale(const Locale('id', 'ID'));
      }
    });
    ever(isDarkMode, (value) {
      if (value) {
        Get.changeThemeMode(ThemeMode.dark);
      } else {
        Get.changeThemeMode(ThemeMode.light);
      }
    });
  }
}
