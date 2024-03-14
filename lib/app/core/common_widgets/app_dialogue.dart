import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showDefaultDialog({
  required String positiveLabel,
  required String negativeLabel,
  Function()? onPositive,
  Function()? onNegative,
}) {
  Get.defaultDialog(
    title: 'Permission Required',
    middleText: 'This permission is required to continue',
    actions: [
      TextButton(
        onPressed: onNegative,
        child: Text(negativeLabel),
      ),
      TextButton(
        onPressed: onPositive,
        child: Text(positiveLabel),
      ),
    ],
  );
}
