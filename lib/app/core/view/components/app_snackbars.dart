import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../values/app_colors.dart';

class AppSnackbars {
  /// Displays a snackbar with the specified parameters.
  ///
  /// The snackbar is displayed using the GetX library's `Get.snackbar` method.
  /// Before a new snackbar is shown, all existing snackbars are closed.
  ///
  /// Parameters:
  /// - `title`: The title of the snackbar. This is a required parameter.
  /// - `message`: The message to be displayed in the snackbar. This is a required parameter.
  /// - `backgroundColor`: The background color of the snackbar. This is a required parameter.
  /// - `snackPosition`: The position of the snackbar on the screen. This is a required parameter with a default value of `SnackPosition.TOP`.
  /// - `snackStyle`: The style of the snackbar. This is an optional parameter with a default value of `SnackStyle.FLOATING`.
  /// - `color`: The color of the text and icon in the snackbar. This is an optional parameter with a default value of `Colors.white`.
  /// - `icon`: The icon to be displayed in the snackbar. This is an optional parameter.
  /// - `durationSeconds`: The duration for which the snackbar is displayed. This is an optional parameter with a default value of 3 seconds.
  ///
  /// The snackbar is displayed with a margin of 12 units on all sides and a padding of 12 units vertically and 16 units horizontally.
  /// The border radius of the snackbar is 12 units.
  /// If an icon is provided, it is displayed with a size of 24 units.
  static void showCustom({
    required String title,
    required String message,
    required Color backgroundColor,
    SnackPosition snackPosition = SnackPosition.TOP,
    SnackStyle snackStyle = SnackStyle.FLOATING,
    Color color = Colors.white,
    IconData? icon,
    int durationSeconds = 3,
  }) {
    // close all snackbars before showing a new one
    Get.closeAllSnackbars();

    // show snackbar
    Get.snackbar(
      title,
      message,
      snackStyle: snackStyle,
      duration: Duration(seconds: durationSeconds),
      margin: REdgeInsets.all(12),
      padding: REdgeInsets.symmetric(vertical: 12, horizontal: 16),
      borderRadius: 12.r,
      colorText: color,
      backgroundColor: backgroundColor,
      snackPosition: snackPosition,
      icon: icon != null
          ? Icon(
              icon,
              color: color,
              size: 24.sp,
            )
          : null,
    );
  }

  /// Shows a success snackbar with a given title and message.
  /// The snackbar is displayed at the top of the screen and lasts for a specified duration (default is 3 seconds).
  static void showSuccess({
    required String title,
    required String message,
    int durationSeconds = 3,
  }) {
    showCustom(
      title: title,
      message: message,
      backgroundColor: AppColors.success,
      icon: Icons.check_circle,
      durationSeconds: durationSeconds,
    );
  }

  /// Shows a warning snackbar with a given title and message.
  /// The snackbar is displayed at the top of the screen and lasts for a specified duration (default is 3 seconds).
  static void showWarning({
    required String title,
    required String message,
    int durationSeconds = 3,
  }) {
    showCustom(
      title: title,
      message: message,
      backgroundColor: AppColors.warning,
      icon: Icons.warning,
      durationSeconds: durationSeconds,
    );
  }

  /// Shows a error snackbar with a given title and message.
  /// The snackbar is displayed at the top of the screen and lasts for a specified duration (default is 3 seconds).
  static void showError({
    required String title,
    required String message,
    int durationSeconds = 3,
  }) {
    showCustom(
      title: title,
      message: message,
      backgroundColor: AppColors.error,
      icon: Icons.error,
      durationSeconds: durationSeconds,
    );
  }

  /// Displays a toast message using the GetX library's rawSnackbar method.
  ///
  /// The [showToast] method allows you to display a toast message with a variety of customization options.
  ///
  /// Parameters:
  /// - [title]: The title of the toast. This is optional and can be null.
  /// - [message]: The message to be displayed in the toast. This is a required parameter.
  /// - [color]: The background color of the toast. By default, it is green.
  /// - [duration]: The duration for which the toast is displayed. By default, it is 3 seconds.
  /// - [snackPosition]: The position of the toast on the screen. By default, it is at the bottom.
  ///
  /// The toast message is displayed using the `Get.rawSnackbar` method. When the toast is tapped, all snackbars are closed.
  ///
  /// Example usage:
  /// ```dart
  /// showToast(
  ///   title: 'Success',
  ///   message: 'The operation was successful.',
  ///   color: Colors.green,
  ///   duration: Duration(seconds: 5),
  ///   snackPosition: SnackPosition.BOTTOM,
  /// );
  /// ```
  static void showToast({
    String? title,
    required String message,
    Color color = Colors.green,
    Duration? duration,
    SnackPosition snackPosition = SnackPosition.BOTTOM,
  }) {
    // show snackbar
    Get.rawSnackbar(
      title: title,
      duration: duration ?? const Duration(seconds: 3),
      snackStyle: SnackStyle.GROUNDED,
      backgroundColor: color,
      snackPosition: snackPosition,
      onTap: (snack) {
        Get.closeAllSnackbars();
      },
      //overlayBlur: 0.8,
      message: message,
    );
  }
}
