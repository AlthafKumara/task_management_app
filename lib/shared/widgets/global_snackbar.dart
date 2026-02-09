import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalSnackbar {
  GlobalSnackbar._();

  static void showSuccess(String message) {
    Get.snackbar(
      "Success",
      message,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  static void showError(String message) {
    Get.snackbar(
      "Error",
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  static void showWarning(String message) {
    Get.snackbar(
      "Warning",
      message,
      backgroundColor: Colors.yellow,
      colorText: Colors.black,
    );
  }
}
