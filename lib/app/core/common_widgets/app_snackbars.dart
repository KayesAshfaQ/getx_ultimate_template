import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/app_colors.dart';

class AppSnackbars {
  static void getSnackBar(
      {title = "Attention",
      message = " Some message",
      int waitingTime = 2,
      int animationDuration = 500,
      snackPosition = SnackPosition.TOP,
      Color backgroundColor = AppColors.black,
      double backgroundColorOpacity = .7,
      colorText = AppColors.white,
      closeAllSnackbars = true}) {
    closeAllSnackbars ? Get.closeAllSnackbars() : null;
    Get.snackbar(title, message,
        snackPosition: snackPosition,
        duration: Duration(seconds: waitingTime),
        animationDuration: Duration(milliseconds: animationDuration),
        backgroundColor: backgroundColor.withOpacity(backgroundColorOpacity),
        colorText: colorText);
  }

  static showCustomSnackBar({required String title, required String message, Duration? duration}) {
    Get.snackbar(
      title,
      message,
      duration: duration ?? const Duration(seconds: 3),
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      colorText: Colors.white,
      backgroundColor: Colors.green,
      icon: const Icon(
        Icons.check_circle,
        color: Colors.white,
      ),
    );
  }

  static showCustomToast({String? title, required String message, Color? color, Duration? duration}) {
    Get.rawSnackbar(
      title: title,
      duration: duration ?? const Duration(seconds: 3),
      snackStyle: SnackStyle.GROUNDED,
      backgroundColor: color ?? Colors.green,
      onTap: (snack) {
        Get.closeAllSnackbars();
      },
      //overlayBlur: 0.8,
      message: message,
    );
  }
}
