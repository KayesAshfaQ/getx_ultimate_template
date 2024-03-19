import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../config/app_colors.dart';

void showConfirmationDialog({
  required String title,
  required String middleText,
  required String positiveLabel,
  required String negativeLabel,
  Function()? onPositive,
  Function()? onNegative,
}) {
  Get.defaultDialog(
    titlePadding: REdgeInsets.only(top: 16),
    contentPadding: REdgeInsets.all(16),
    title: title,
    middleText: middleText,
    actions: [
      TextButton(
        onPressed: onNegative,
        child: Text(
          negativeLabel,
          style: const TextStyle(color: AppColors.error),
        ),
      ),
      TextButton(
        onPressed: onPositive,
        child: Text(
          positiveLabel,
          style: const TextStyle(color: AppColors.secondary),
        ),
      ),
    ],
  );
}
