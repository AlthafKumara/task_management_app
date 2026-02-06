import 'dart:ui';

import 'package:get/get.dart';

class GlobalFlagSwitchController extends GetxController {
  var isEnglish = true.obs;

  void toggleFlag() {
    isEnglish.toggle();
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
  }
}