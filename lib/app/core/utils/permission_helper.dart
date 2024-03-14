import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../common_widgets/app_dialogue.dart';
import '../common_widgets/app_snackbars.dart';

class PermissionHelper {
  static Future<PermissionStatus> requestPermission(
    Permission permission, {
    Function()? onGranted,
    Function()? onDenied,
    Function()? onPermanentlyDenied,
    Function()? onRestricted,
  }) async {
    final status = await permission.status;

    if (!status.isGranted) {
      onGranted ??= () => AppSnackbars.showCustomSnackBar(
            title: permission.toString() + ' Permission Granted',
            message: 'You can now use the ' + permission.toString(),
          );

      onDenied ??= () => AppSnackbars.showCustomSnackBar(
            title: '$permission Permission Denied',
            message: 'You cannot use the $permission',
            color: Get.theme.snackBarTheme.backgroundColor,
          );
      onPermanentlyDenied ??= () => _openSettings();
      onRestricted ??= () => _openSettings();

      return await permission
          .onGrantedCallback(onGranted)
          .onDeniedCallback(onDenied)
          .onPermanentlyDeniedCallback(onPermanentlyDenied)
          .onRestrictedCallback(onRestricted)
          .request();
    } else {
      return status;
    }
  }

  static Future<bool> hasPermission(Permission permission) async {
    final status = await permission.status;
    return status.isGranted;
  }

  // Open App Settings
  static Future<void> _openSettings() async {
    // show a dialog to the user to open the settings
    // if the user clicks on the open settings button
    // then open the app settings
    showDefaultDialog(
      positiveLabel: 'Open Settings',
      negativeLabel: 'Cancel',
      onPositive: () async {
        Get.back();
        await openAppSettings();
      },
      onNegative: () {
        Get.back();
      },
    );
  }
}
