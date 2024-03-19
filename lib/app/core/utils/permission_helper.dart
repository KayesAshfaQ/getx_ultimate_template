import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../components/app_dialogue.dart';
import '../components/app_snackbars.dart';

class PermissionHelper {
  /// Requests a specific permission from the user.
  ///
  /// This method will request the specified [permission] from the user. If the permission is not already granted,
  /// it will trigger the appropriate callback based on the user's response. If the permission is already granted,
  /// it will simply return the current permission status.
  ///
  /// [permission] is the specific permission to request.
  ///
  /// [permissionName] is the name of the permission to request. This is used in the snackbar messages.
  ///
  /// [onGranted] is an optional callback that will be triggered if the permission is granted. If not provided,
  /// a default snackbar message will be shown indicating that the permission was granted.
  ///
  /// [onDenied] is an optional callback that will be triggered if the permission is denied. If not provided,
  /// a default snackbar message will be shown indicating that the permission was denied.
  ///
  /// [onPermanentlyDenied] is an optional callback that will be triggered if the permission is permanently denied.
  /// If not provided, the default action is to open the app settings.
  ///
  /// [onRestricted] is an optional callback that will be triggered if the permission is restricted.
  /// If not provided, the default action is to open the app settings.
  ///
  /// Returns a [Future] that completes with the final [PermissionStatus] after the user has responded to the request.
  static Future<PermissionStatus> requestPermission(
    Permission permission, {
    required String permissionName,
    Function()? onGranted,
    Function()? onDenied,
    Function()? onPermanentlyDenied,
    Function()? onRestricted,
  }) async {
    final status = await permission.status;

    // if the permission is not granted then request the permission
    if (!status.isGranted) {
      onGranted ??= () => AppSnackbars.showSuccess(
            title: '$permissionName Permission Granted',
            message: 'You can now use the $permissionName',
          );

      onDenied ??= () => AppSnackbars.showError(
            title: '$permission Permission Denied',
            message: 'You cannot use the $permission',
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
    showConfirmationDialog(
      title: 'Permission Required',
      middleText: 'This permission is required to continue',
      positiveLabel: 'Open Settings',
      negativeLabel: 'Cancel',
      onPositive: () async {
        Get.back();
        await openAppSettings();
      },
      onNegative: () {
        // cancel the dialog
        Get.back();
      },
    );
  }
}
