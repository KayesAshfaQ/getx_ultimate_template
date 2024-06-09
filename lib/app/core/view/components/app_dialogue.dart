import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../gen/assets.gen.dart';
import '../../../services/internet_connection/internet_connection_checker.dart';
import '../../values/theme/app_colors.dart';
import 'app_image_view.dart';

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

void showNoInternetConnectionDialog() {
  Get.defaultDialog(
    titlePadding: REdgeInsets.only(top: 16),
    contentPadding: REdgeInsets.all(16),
    barrierDismissible: false,
    content: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppImageView(
          Assets.imagesNoInternet.path,
          height: 60,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 32),
        const Text(
          "Whoops!",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        const Text(
          "No internet connection found.",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        const Text(
          "Check your connection and try again.",
          style: TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          child: const Text("Try Again"),
          onPressed: () async {
            // check the internet connection again and update the status
            final service = Get.find<InternetConnectionCheckService>();
            await service.checkStatus();

            // if the internet connection is available, close the dialog
            if (service.isInternetConnected) {
              Get.back(closeOverlays: true);
            }
          },
        )
      ],
    ),
  );
}
