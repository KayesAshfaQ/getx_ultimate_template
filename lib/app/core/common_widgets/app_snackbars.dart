import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackbars {
  static showCustomSnackBar({
    required String title,
    required String message,
    int durationSeconds = 3,
    Color? color,
    SnackPosition snackPosition = SnackPosition.TOP,
  }) {
    // close all snackbars before showing a new one
    Get.closeAllSnackbars();

    // show snackbar
    Get.snackbar(
      title,
      message,
      duration: Duration(seconds: durationSeconds),
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      colorText: Colors.white,
      backgroundColor: color ?? Colors.green,
      snackPosition: snackPosition,
      icon: const Icon(
        Icons.check_circle,
        color: Colors.white,
      ),
    );
  }

  static showCustomToast({
    String? title,
    required String message,
    Color? color,
    Duration? duration,
    SnackPosition snackPosition = SnackPosition.BOTTOM,
  }) {

    // close all snackbars before showing a new one
    Get.closeAllSnackbars();

    // show snackbar
    Get.rawSnackbar(
      title: title,
      duration: duration ?? const Duration(seconds: 3),
      snackStyle: SnackStyle.GROUNDED,
      backgroundColor: color ?? Colors.green,
      snackPosition: snackPosition,
      onTap: (snack) {
        Get.closeAllSnackbars();
      },
      //overlayBlur: 0.8,
      message: message,
    );
  }
}
